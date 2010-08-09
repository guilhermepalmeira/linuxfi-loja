class Item < ActiveRecord::Base

  belongs_to :produto, :class_name => "Produto", :foreign_key => "produto_id" #um item pertence a um produto(nao eh necessario o que vem depois da virgula, pq produto eh mesmo nome de classe
  belongs_to :pedido #um item pertence a um pedido

  validates_numericality_of :quantidade

  def preco_total
    self.quantidade * self.produto.preco
  end

end