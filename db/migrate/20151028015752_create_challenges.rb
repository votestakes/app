class CreateChallenges < ActiveRecord::Migration
  def change
    create_table :challenges, id: :uuid do |t|
      t.date :date
      t.text :description

      t.timestamps null: false
    end
  end
end
