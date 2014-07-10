class RenameYosToGreetings < ActiveRecord::Migration
  def change
    rename_table :yos, :greetings
  end
end
