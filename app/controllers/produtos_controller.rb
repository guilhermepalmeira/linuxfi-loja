class ProdutosController < ApplicationController

  def show
    @produto = Produto.find(params[:id])
  end

  def index
    @titulo = 'Listagem de Produtos'
    #@produtos = Produto.all#pega todos os produtos do banco e poe nessa variavel de instancia
    @produtos = if params[:q].blank?
      Produto.all
    else
=begin
      Produto.all(:conditions => [
          "nome LIKE ? OR descricao LIKE ?",
          "%#{params[:q]}%",
          "%#{params[:q]}%"],
          :order => "preco ASC"
        )
=end
      resultado = Produto.solr_search do |s|
        s.keywords params[:q]
      end
      resultado.results
    end

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