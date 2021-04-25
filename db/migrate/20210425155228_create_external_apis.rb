class CreateExternalApis < ActiveRecord::Migration[6.0]
  def change
    create_table :external_apis do |t|
      t.string :name
      t.text :description
      t.references :partner, null: false, index: true

      t.timestamps
    end

    add_reference :endpoints, :external_api, index: true
  end
end
