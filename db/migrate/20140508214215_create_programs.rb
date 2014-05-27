class CreatePrograms < ActiveRecord::Migration
  def change
    create_table :programs do |t|
      t.string :name, :null => false
      t.integer :maximum_participants, :null => false
      t.integer :minimum_age
      t.integer :maximum_age
      t.text :description

      t.timestamps
    end
  end
end
