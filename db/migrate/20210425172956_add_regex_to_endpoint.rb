class AddRegexToEndpoint < ActiveRecord::Migration[6.0]
  def change
    add_column :endpoints, :regex, :string, index: true
  end
end
