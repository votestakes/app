class NewChallengeFields < ActiveRecord::Migration
  def change
    add_column :challenges, :stakes, :text
    add_column :challenges, :friends, :text
  end
end
