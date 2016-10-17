class AddApiTokenToArchangelUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :archangel_users, :api_token, :string

    add_index :archangel_users, :api_token, unique: true
  end
end
