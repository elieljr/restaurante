class CreateRestaurantes < ActiveRecord::Migration
  def self.up #self faz referência a um método estático
    # add_columm :restaurantes, :especialidade, :string, :limit=>80
    create_table :restaurantes do |t| # t de tabela; o "do" passa código para o método "create_table"
      #t.date
      #t.datetime
      #t.time
      t.string :nome, :limit=>90 # <t>.<tipo do campo> :<nome do campo>
      t.string :endereco
      t.timestamps #log do bd
    end
  end

  def self.down
    drop_table :restaurantes
  end
end