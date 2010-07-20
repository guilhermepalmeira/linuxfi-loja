# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password

  helper_method :pedido_atual#pra o metodo ficar disponivel pras views

  protected

  def pedido_atual
    unless @pedido_atual
      @pedido_atual = session[:pedido_id].blank? ? #Se ja tiver pedido na sessao do usuarios, da um find pra achar ele, se nao da um new nele, cira um novo
        Pedido.new : Pedido.find(session[:pedido_id])
    end
    @pedido_atual
  end

  def load_page
    @page = params[:page] || 1
    @per_page = params[:per_page] || 10
    if @per_page.to_i > 30 #se receber mais de q 30 itens por pagina
      @per_page = 30 #mostra so os 30 pra nao estourar o BD(nunca confie no usuario)
    end
  end

  def paginate(scope, options = {})
    load_page
    scope.paginate({:page => @page, :per_page => @per_page}.merge(options))
  end

end
