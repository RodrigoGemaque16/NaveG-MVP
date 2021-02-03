class CreateHarbors < ActiveRecord::Migration[6.0]
  def change
    create_table :harbors do |t|
      t.string :name
      t.string :city
      t.string :state

      t.timestamps
    end
  end
end
