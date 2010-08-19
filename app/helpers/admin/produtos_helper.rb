module Admin::ProdutosHelper #no pode herdar de mais de uma classe dessa forma usa os modulos, ou seja, define um conjunto de metodos pra ser utlizador em outras classes, pq em ruby nao existe herança multipla

  def admin_form_for_produto( &block )
    opcoes = if @produto.new_record?
      [admin_produtos_path, :post]
    else
      [admin_produto_path( @produto ), :put]
    end
    form_for( @produto,
      :url => opcoes.first,
      :html => { 
        :method => opcoes.last,
        :multipart => true #campo de arquivo no formulario, para enviar pro servidor
               },
      &block
    )
  end

end