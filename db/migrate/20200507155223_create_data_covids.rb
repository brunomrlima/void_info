class CreateDataCovids < ActiveRecord::Migration[6.0]
  def change
    create_table :data_covids do |t|
      t.references :data_covids, null: false, index: true, foreign_key: true
      t.integer :total_cases
      t.integer :new_cases
      t.integer :total_deaths
      t.integer :new_deaths
      t.integer :total_recovered
      t.integer :active_cases
      t.integer :critical_cases
      t.integer :total_cases_per_million
      t.integer :deaths_per_million
      t.integer :total_tests
      t.integer :tests_per_million

      t.timestamps
    end
  end
end
