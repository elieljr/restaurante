class RestauranteObserver < ActiveRecord::Observer
  def before_create(r)
    puts "Logando a gravação #{r.nome}"
  end
 
  
end
