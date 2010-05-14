class Cliente < ActiveRecord::Base
  #Validação de dados
  validates_presence_of :nome, :message => "Nome do cliente deve ser informado"
  validates_uniqueness_of :nome, :message => "Nome do cliente já cadastrado"
  
  validates_numericality_of  :idade,
                            :greater_than => 0,
                            :less_than => 100,
                            :message => "Idade deve ser um número entre 0 e 100"
  #Relacionamento
  has_many :qualificacoes
                              
end
