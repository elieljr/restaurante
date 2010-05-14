class HelloWorldController < ApplicationController
  def index
    #render :text=>"Página principal."
    #redirect_to(:action=>"hello")
    hello
  end
  def hello
    render :text=>"Hello world!"
  end
end
