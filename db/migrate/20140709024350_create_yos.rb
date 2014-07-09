class CreateYos < ActiveRecord::Migration
  def change
    create_table :yos do |t|
      t.integer :sender_id, null: false
      t.integer :receiver_id, null: false
      t.timestamps null: false
    end
  end
end
