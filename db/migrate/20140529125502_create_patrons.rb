class CreatePatrons < ActiveRecord::Migration
  def change
    create_table :patrons do |t|
      t.string :name, :null => false
      t.integer :age, :null => false
      t.string :address_street
      t.string :address_city
      t.string :address_zipcode
      t.string :phone_number

      t.timestamps
    end
  end
end
