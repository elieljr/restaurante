class CreateComments < ActiveRecord::Migration
  def self.up
    create_table :comments do |t|
      t.text :conteudo
      t.integer :comentavel_id
      t.string :comentavel_type

      t.timestamps
    end
    add_index :comments, :comentavel_type
    add_index :comments, :comentavel_id
    
  end

  def self.down
    drop_table :comments
  end
end
