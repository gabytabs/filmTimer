class CreateFilms < ActiveRecord::Migration[5.0]
  def change
    create_table :films do |t|
      t.string :name
      t.string :developer
      t.string :dilution
      t.string :ISO
      t.string :film35mm
      t.string :film120
      t.string :sheet
      t.string :temp
      t.string :notes

      t.timestamps
    end
  end
end
