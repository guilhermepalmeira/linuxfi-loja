class ProdutosController < ApplicationController

  def index
    @titulo = 'Listagem de Produtos'
    @produtos = Produto.all#pega todos os produtos do banco e poe nessa variavel de instancia
    
    respond_to do |format|#metodo para transformar o formato da pagina, nesse caso em XML por exemplo
      format.html do
        render :index
      end
      format.xml do 
        render :xml => @produtos
      end
    end

  end

end