class Prato < ActiveRecord::Base
  #Validação de dados
  validates_presence_of :nome, :message => "Nome do prato deve ser informado"
  validates_uniqueness_of :nome, :message => "Nome do prato já cadastrado"
  
  validate :validate_presence_of_more_than_one_restaurante
  
  private
  def validate_presence_of_more_than_one_restaurante
    errors.add("restaurantes", "Deve haver ao menos um restaurante") if restaurantes.empty?
  end
  
  #Relacionamentos
  has_and_belongs_to_many :restaurantes
  has_one :receita
  
end
