class CreateHarbors < ActiveRecord::Migration[6.0]
  def change
    create_table :harbors do |t|
      t.string :name
      t.references :city, null: false, foreign_key: true

      t.timestamps
    end
  end
end
