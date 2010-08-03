class UsuarioMailer < BaseMailer

  def cadastro( usuario )
    defaults
    subject "[Minha Loja] - Olá #{usuario.nome}"
    recipients usuario.email
    body :usuario => usuario
  end

end