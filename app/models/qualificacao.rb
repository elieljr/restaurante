class Qualificacao < ActiveRecord::Base
  #Validação de dados
  validates_presence_of :nota, :message => "Nota deve ser informada"
  validates_presence_of :valor_gasto, :message => "Valor gasto deve ser informado"
  
  validates_numericality_of  :nota,
                            :greater_than_or_equal_to => 0,
                            :less_than_or_equal_to => 10,
                            :message => "Nota deve ser um número entre 0 e 10"
  
  validates_numericality_of  :valor_gasto,
                            :greater_than => 1,                            
                            :message => "Valor gasto deve ser um número maior do que 0"
  
  validates_presence_of :cliente_id, :restaurante_id
  validates_associated :cliente, :restaurante
  
  #Relacionamento
  belongs_to :restaurante
  belongs_to :cliente
  
  has_many :comments, :as=>:comentavel
  
end