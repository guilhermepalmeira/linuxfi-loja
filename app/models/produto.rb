
class Produto < ActiveRecord::Base #o nome dessa classe no plural que vai ser a tabela do BD

  #set_table_name 'produto' # se quiser setar outro nome pra tabela do BD
  validates_presence_of :nome, :preco
  validates_numericality_of :preco, :greater_than => 0, :allow_nil => true

end