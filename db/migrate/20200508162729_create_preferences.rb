class CreatePreferences < ActiveRecord::Migration[6.0]
  def change
    create_table :preferences do |t|
      t.references :email, null: false, foreign_key: true, index: true
      t.references :country, null: false, foreign_key: true, index: true

      t.timestamps
    end
  end
end
