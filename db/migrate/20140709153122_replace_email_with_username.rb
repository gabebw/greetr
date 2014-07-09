class ReplaceEmailWithUsername < ActiveRecord::Migration
  def up
    add_column :users, :username, :string
    update "UPDATE users SET username = substr(email, 0, strpos(email, '@'))"
    change_column_null :users, :username, false
    add_index :users, :username, unique: true

    remove_column :users, :email
  end

  def down
    add_column :users, :email, :string

    update "UPDATE users SET email = username || '@example.com'"

    remove_column :users, :username
  end
end
