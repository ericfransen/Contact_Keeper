class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|

      t.string :first_name
      t.string :last_name
      t.string :address
      t.string :city
      t.string :state_province
      t.string :country
      t.string :zip
      t.string :phone
      t.string :email

      t.timestamps null: false
    end

    add_index :contacts, :email, unique: true

  end
end
