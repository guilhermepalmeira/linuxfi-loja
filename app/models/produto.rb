
class Produto < ActiveRecord::Base #o nome dessa classe no plural que vai ser a tabela do BD

  #set_table_name 'produto' # se quiser setar outro nome pra tabela do BD

  searchable do
    text :nome, boost => 2.0
    text :descricao
    float :preco
  end

  validates_presence_of :nome, :preco
  validates_numericality_of :preco, :greater_than => 0, :allow_nil => true

  has_attached_file :imagem,
    :styles => {:medium => "300x300>", :thumb => "100x100>"},
    :path => ":rails_root/public/system/:class/:attachment/:id_partition/:style/:filename",
    :url => "/system/:class/:attachment/:id_partition/:style/:filename",
    :convert_options => { :all => '-strip' }

end