class Receita < ActiveRecord::Base
  #Validação de dados
  validates_presence_of :conteudo, :message => "Receita deve ser informada"
  
  validates_presence_of :prato_id
  validates_associated :prato
  
  #Relacionamentos
  belongs_to :prato
  
end
