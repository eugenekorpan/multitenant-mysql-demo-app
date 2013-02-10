class MysqlAccount < ActiveRecord::Base
  attr_accessible :name

  acts_as_tenant

end
