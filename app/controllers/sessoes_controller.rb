class SessoesController < ApplicationController

  def show
    render :new
  end

  alias :new :show

  def create
    @usuario = Usuario.autenticar(params[:email], params[:senha])
    if @usuario
      self.usuario_atual = @usuario
      respond_to do |format|
        format.html do
          flash[:aviso] = "Seja Bem Vindo a Aplicação, #{self.usuario_atual.nome}"
          redirect_to produtos_path
        end
      end
    else
      respond_to do |format|
        format.html do
          flash.now[:erro] = "Não foi possivel fazer seu login com os dados recebidos"
          show
        end
      end
    end
  end

  def destroy
    reset_session
    respond_to do |format|
      format.html do
        flash[:aviso] = "Você saiu da aplicação com sucesso"
        redirect_to produtos_path
      end
    end
  end

end