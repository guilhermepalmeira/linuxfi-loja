# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

  def cabecalho_de_tabela(*args)#esse metodo na hora q for chamado, vai receber n paramentro unidos por um array
    colunas = args.map {|coluna| "<th>#{coluna}</th>\n"}#transforma de string pra coluna da tabela
    linha = content_tag(:tr, colunas)#cria um tag tr, passando colunas
    content_tag(:thead, linha)
  end

  def render_flash
    render "compartilhados/flash", :flash => flash
  end

end
