class CreateMysqlAccounts < ActiveRecord::Migration
  def change
    create_table :mysql_accounts do |t|
      t.string :name

      t.timestamps
    end
  end
end
