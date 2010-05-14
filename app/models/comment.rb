class Comment < ActiveRecord::Base
  belongs_to :comentavel, :polymorphic=>true
end
