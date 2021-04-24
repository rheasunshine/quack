class CreateEndpoints < ActiveRecord::Migration[6.0]
  def change
    create_table :endpoints do |t|
      t.string :name
      t.text :description
      t.string :endpoint

      t.timestamps
    end
  end
end
