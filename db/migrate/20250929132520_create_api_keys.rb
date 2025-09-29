class CreateApiKeys < ActiveRecord::Migration[8.0]
  def change
    create_table :api_keys do |t|
      t.string :access_token
      t.string :secret_key

      t.timestamps
    end

    add_index :api_keys, :access_token, unique: true
    add_index :api_keys, :secret_key, unique: true
  end
end
