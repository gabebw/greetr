class AddBodyToGreetings < ActiveRecord::Migration
  def change
    add_column :greetings, :body, :string, null: false, default: "Yo!"
  end
end
