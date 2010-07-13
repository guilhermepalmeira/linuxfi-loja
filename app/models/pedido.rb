class Pedido < ActiveRecord::Base

  has_many :itens #um pedido tem vários itens

  def adicionar_produto(produto, quantidade)
    if item = self.itens.detect { |i| i.produto == produto }
      item.update_attributes(:quantidade => quantidade + item.quantidade)#se ja tiver adiciona mais um produto
    else
      self.itens.build( :produto_id => produto.id, :quantidade => quantidade )#se nao, cria um novo objeto do tipo item atravez do metodo build
    end
  end

end
