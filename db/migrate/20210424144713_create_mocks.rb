class CreateMocks < ActiveRecord::Migration[6.0]
  def change
    create_table :mocks do |t|
      t.string :name
      t.text :description
      t.string :request_method
      t.string :content_type
      t.string :body_type
      t.json :body_content
      t.boolean :active
      t.integer :position
      t.references :endpoint, null: false #, foreign_key: true

      t.timestamps
    end
  end
end
