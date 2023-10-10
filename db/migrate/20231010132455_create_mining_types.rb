class CreateMiningTypes < ActiveRecord::Migration[7.1]
  def change
    create_table :mining_types do |t|
      t.string :description
      t.string :acronym
      t.string :string

      t.timestamps
    end
  end
end
