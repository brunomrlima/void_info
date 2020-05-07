class CreateCountries < ActiveRecord::Migration[6.0]
  def change
    create_table :countries do |t|
      t.references :continents, null: false, index: true, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end
