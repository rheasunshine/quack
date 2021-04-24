class CreateHeaders < ActiveRecord::Migration[6.0]
  def change
    create_table :headers do |t|
      t.string :name
      t.text :value
      t.references :mock, null: false #, foreign_key: true

      t.timestamps
    end
  end
end
