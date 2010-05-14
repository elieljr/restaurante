# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def menu_principal
    @menu = %w(cliente qualificacao restaurante)
    menu_principal = "<ul>"
    @menu.each do |item|
      menu_principal << "<li>" + link_to(item, :controller=> item.pluralize)+"</li>"
    end
    menu_principal << "<ul>"
    menu_principal
  end
  
  def comments (comentavel)
    comments = "<div id='comments'>"    
    comments << "<h3>Comentarios</h3>"
    comments << render(:partial => "comments/comment",
                        :collection => comentavel.comments)    
    comments << "</div>"   
    
  end
  
  def novo_comment(comentavel)
      render(:partial => "comments/novo_comment",
                  :locals => { :comentavel => comentavel })
  end
  
  def valor_formatado(number)
    number_to_currency(number, :unit=>"R$", :separator=>",", :delimiter=>".")
  end

end
