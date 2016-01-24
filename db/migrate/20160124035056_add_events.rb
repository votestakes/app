class AddEvents < ActiveRecord::Migration
  def change
    create_table :events, id: :uuid do |t|
      t.text :name, null: false
    end

    rename_column :challenges, :friends, :challengee
    add_column :challenges, :event_id, :uuid, index: true
    add_column :challenges, :challenger, :text
    add_column :challenges, :emotion, :text
    add_column :challenges, :meme_name, :text
    add_column :challenges, :meme_style, :text
  end
end
