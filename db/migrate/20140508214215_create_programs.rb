class CreatePrograms < ActiveRecord::Migration
  def change
    create_table :programs do |t|
      t.string :name
      t.integer :capacity
      t.integer :minimum_age
      t.integer :maximum_age

      t.timestamps
    end
  end
end
