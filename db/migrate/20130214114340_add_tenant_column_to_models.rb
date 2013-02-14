class AddTenantColumnToModels < ActiveRecord::Migration
  def change
    add_column :books, :tenant, :string
  end
end
