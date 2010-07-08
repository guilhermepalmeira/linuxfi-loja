class CriarProdutos < ActiveRecord::Migration #ta herdando de ActiveRecord
 
  def self.up

    create_table :produtos do |t|
      t.string :nome, :null  => false, :limit => 100 #nao pode ser nulo limite de 100 caracs, se nao por seria 255
      t.text :descricao
      t.decimal :preco, :precision => 10, :scale => 2, :null => false#nao pode ser nulo
      t.timestamps #cria as colunas CREATED_AT e UPDATE_AT, especificando o dia e a hora q criou ou atualizou
    end

  end

  def self.down

    drop_table :produtos

  end
end
