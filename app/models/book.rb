class Book < ActiveRecord::Base
  attr_accessible :price, :title

  #set_table_name 'books_view'
  #set_primary_key :id

end
