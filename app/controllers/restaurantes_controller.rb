class RestaurantesController < ApplicationController
  
  #método defaut
  def index
    redirect_to :action=>"list"
    
  end
  
  #metodo de novo form
  def new
    @restaurante = Restaurante.new
    
  end
 
  #método para salvar
  def create
    @restaurante = Restaurante.new(params[:restaurante])
    if @restaurante.save
      redirect_to(:action=>"show", :id=> @restaurante)
      flash[:notice]="Restaurante criado com sucesso."
    
    else
      render :action=>"new"
      
    end
  end
  
  #metodo para exibir específico
  def show
    @restaurante = Restaurante.find(params[:id])
    
  end
  
  #método de edição
  def edit
    @restaurante=Restaurante.find(params[:id])
    
  end
  
  #método para exibir todos
  def list #muita gente acaba não criando esse método porque muitos usam esse método na página index
    #@restaurantes = Restaurante.find (:all, :order => "nome")
    @restaurantes = Restaurante.paginate :page=>params['page'], :per_page=>3, :order=>"nome"
    respond_to do |format|
      format.html
      format.xml {render :xml=>@restaurantes}
    end  
    
  end
  
  #método de atualização
  def update
    @restaurante = Restaurante.find(params[:id])
    if @restaurante.update_attributes(params[:restaurante])
      redirect_to(:action=>"show", :id=>@restaurante)
      flash[:notice]="Restaurante atualizado com sucesso."
      
    else
      render :action=>"edit"
      
    end
    
  end
  
  #método de remoção. Apenas um método basta para destruir algo.
  def destroy
    restaurante = Restaurante.find(params[:id])
    restaurante.destroy
    flash[:notice]="Restaurante deletado com sucesso."
    
    redirect_to :action=>"index"
  end  
  
  def search    
    @restaurantes = Restaurante.find(:all,:conditions=>"especialidade='#{params[:especialidade]}'")
    render :action=>"list"
    
  end
    
end
