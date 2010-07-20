class Admin::ProdutosController < Admin::BaseController

  before_filter :load_produto, :only => [:new, :edit, :create, :update, :destroy]#antes dele executar new, edit,etc, ele deve chamar o metodo load_produto, pra fzr a inicialização da variavel produto

  def index
   # load_page
   # @produtos = Produto.paginate( :page => @page, :per_page => @per_page )
    @produtos = paginate(Produto) #as dias linhas de cima é equivalente a isso aqui
    respond_to do |format|
      format.html
    end
  end

  def new
    #@produto = Produto.new
    respond_to do |format|
      format.html do
        render :new
      end
    end
  end

  alias :edit :new # diz que o metodo :edit é um :new ( a mesma coisa), logo nao precisa criar um metodo edit.
  #def edit; new; end # mesma coisa do de cima

  # def edit
  #  @produto = Produto.find(params[:id])
  # respond_to do |format|
  #  format.html do
  #   render :edit
  # end
  # end
  #end

  def create
    if @produto.update_attributes(params[:produto])
      ir_para_listagem("Produto criado/atualizado com sucesso")
         else
      self.new
    end
  end

  alias :update :create #qdo for um :update na verdade vai chamar o create

  def destroy
    @produto.destroy
    ir_para_listagem("Produto Removido com Sucesso!")
  end

  protected

  def load_produto#o metodo verifica se é vazio, se for cira um novo, senão procura pelo id
    @produto = params[:id].blank? ? Produto.new : Produto.find( params[:id] )
  end

  def ir_para_listagem(mensagem)
    respond_to do |format|
        format.html do
          flash[:aviso] = mensagem
          redirect_to admin_produtos_path
        end
      end
  end

end
