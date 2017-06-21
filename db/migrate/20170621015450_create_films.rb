class CreateFilms < ActiveRecord::Migration[5.0]
  def change
    create_table :films do |t|
      t.string :name
      t.string :developer
      t.string :dilution
      t.string :ISO
      t.integer :time
      t.string :temp

      t.timestamps
    end
  end
end
