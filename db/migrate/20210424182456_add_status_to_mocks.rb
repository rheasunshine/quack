class AddStatusToMocks < ActiveRecord::Migration[6.0]
  def change
    add_column :mocks, :status, :integer
  end
end
