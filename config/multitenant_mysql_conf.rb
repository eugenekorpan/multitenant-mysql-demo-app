class ViewGenerator
  def self.run
    Multitenant::Mysql.models.each do |model_name|
      model = model_name.to_s.camelcase.constantize
      columns = model.column_names.join(', ')

      view_sql = %Q(
        CREATE VIEW #{model_name.to_s.pluralize}_view AS
        SELECT #{columns}
        FROM #{model.table_name}
        WHERE tenant = SUBSTRING_INDEX(USER(), '@', 1);
      )

      ActiveRecord::Base.connection.execute(view_sql)
    end
  end
end

class TriggerGenerator
  def self.run
    Multitenant::Mysql.models.each do |model_name|
      model = model_name.to_s.camelcase.constantize
      
      trigger_sql = %Q(
        CREATE TRIGGER #{model.table_name}_tenant_trigger
        BEFORE INSERT ON #{model.table_name}
        FOR EACH ROW
        SET new.tenant = SUBSTRING_INDEX(USER(), '@', 1);
      )
      
      ActiveRecord::Base.connection.execute(trigger_sql)
    end
  end
end

module Multitenant
  module Mysql
    def self.models=(models)
      @models = models
    end
    
    def self.models
      @models
    end
  end
end

Multitenant::Mysql.models = [:book]
