class OrdenNetMultix < ActiveRecord::Base
  establish_connection "#{Rails.env}_netmultix"

  self.table_name = ''
end
