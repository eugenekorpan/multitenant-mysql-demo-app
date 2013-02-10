Multitenant::Mysql.active_record_configs = {
  models: ['Book'],
  tenant_model: { name: 'MysqlAccount', tenant_name_attr: :name }
}
