# simple example
#
# Multitenant::Mysql.active_record_configs = {
#   models: ['Book', 'Task'],
#   tenant_model: { name: 'Subdomains', tenant_name_attr: name }
# }
#
# where:
# models - list of tenant related models
# tenant_model - model where tenant info is stored
#   name - model name
#   tenant_name_attr - attribute used to fetch tenant name

Multitenant::Mysql.active_record_configs = {
  models: ['Book'],
  tenant_model: { name: 'MysqlAccount' }
}
