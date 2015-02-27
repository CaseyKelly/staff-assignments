class CreateAssignments < ActiveRecord::Migration
  def change
    create_table :assignments do |t|
      t.belongs_to :person, index: true
      t.belongs_to :location, index: true

      t.timestamps null: false
    end
    add_foreign_key :assignments, :people
    add_foreign_key :assignments, :locations
  end
end
