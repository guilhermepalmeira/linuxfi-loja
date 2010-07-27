class ItensController < ApplicationController

  #commit do master
  #commit em usuarios

  def create
    @produto = Produto.find(params[:produto_id])#carrega o pedido

    pedido_atual.adicionar_produto(@produto, params[:quantidade].to_i)
    pedido_atual.save

    session[:pedido_id] = pedido_atual.id#coloca o id do pedido na sessao
    
    ir_para_carrinho("Produto #{@produto.nome} adicionado com sucesso ao carrinho")
    
  end

  def atualizar_pedido
    pedido_atual.update_attributes(params[:pedido])
    ir_para_carrinho("Carrinho atualizado com sucesso")
  end

  protected

  def ir_para_carrinho(mensagem)
        respond_to do |format|
      format.html do
        flash[:aviso] = (mensagem)
        redirect_to itens_path
      end
    end
  end
 
end