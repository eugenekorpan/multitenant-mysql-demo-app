class User < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :tenant_id
  belongs_to :tenant, foreign_key: :tenant_id, class_name: 'MysqlAccount'

  def full_name
    [first_name, last_name].compact.join(' ')
  end
end
