class AddHarborRefToCities < ActiveRecord::Migration[6.0]
  def change
    add_reference :cities, :harbor, foreign_key: true
  end
end
