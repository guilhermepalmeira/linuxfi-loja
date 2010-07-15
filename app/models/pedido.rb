class Pedido < ActiveRecord::Base

  has_many :itens, :dependent => :destroy #um pedido tem vários itens, o :dependent, destroy o item se ele for zero
  accepts_nested_attributes_for :itens #vai aceitar receber os atributos de forma aninhada
  #vai atumaticamente criar no seu objeto um metodo "itens_attributes", criadno um array de hashs"
  #def itens_attributes=(array)
  after_save :remover_itens_zerados#gancho pra remover do carrinho qdo for zerado

  def adicionar_produto(produto, quantidade)
    if item = self.itens.detect { |i| i.produto == produto }
      item.update_attributes(:quantidade => quantidade + item.quantidade)#se ja tiver adiciona mais um produto
    else
      self.itens.build( :produto_id => produto.id, :quantidade => quantidade )#se nao, cria um novo objeto do tipo item atravez do metodo build
    end
  end

  def preco_total
    self.itens.to_a.sum( &:preco_total )#metodo to_a convete pra array
    #self.itens.to_a.sum{ |item| item.preco_total }# a mesma coisa do codigo de cima, o & o substitui
  end

  def blank?#pergunta se o objeto ta vazio
    self.itens.blank?
  end

  protected

  def remover_itens_zerados
    itens_a_remover = []
    self.itens.each do |item|
      if item.quantidade.blank? || item.quantidade < 1
        itens_a_remover << item
      end
    end
    self.itens.delete( *itens_a_remover )
    true
  end

end
