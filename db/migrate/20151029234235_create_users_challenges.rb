class CreateUsersChallenges < ActiveRecord::Migration
  def change
    create_table :challenges_users, id: :uuid do |t|
      t.uuid :user_id, index: true
      t.uuid :challenge_id, index: true
    end
  end
end
