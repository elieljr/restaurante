class Restaurante < ActiveRecord::Base
  #Validação de dados
  validates_presence_of :nome, :message => "Nome do restaurante deve ser informado"
  validates_presence_of :endereco, :message => "Endereço deve ser informado"
  validates_presence_of :especialidade, :message => "Especialidade deve ser informada"

  
  validates_uniqueness_of :nome, :message => "Nome do restaurante já cadastrado"
  validates_uniqueness_of :endereco, :message => "Endereço já cadastrado"
  
  validate :primeira_letra_deve_ser_maiuscula
  
  #Relacionamento
  has_many :qualificacoes
  has_and_belongs_to_many :pratos
  has_many :comments, :as=>:comentavel
  
  private
  def primeira_letra_deve_ser_maiuscula
    errors.add("nome", "Primeira letra do nome deve ser maiuscula") unless nome =~ /[A-Z].*/
  end
end
