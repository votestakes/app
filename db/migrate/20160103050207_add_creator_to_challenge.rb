class AddCreatorToChallenge < ActiveRecord::Migration
  def change
    add_column :challenges, :creator_id, :uuid
  end
end
