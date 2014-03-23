# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

u = User.find_by_id( 1 )
if u == nil || u.email != "root@example.com"
  root_admin = User.create({first_name: 'Root', last_name: 'Admin', id: 1, email: "root@example.com", password: "password", admin: true}, :without_protection => true)
  root_admin.confirm!
end

# Build SecEventType items
SecEventType.where(type_cd: 'RFIDDNE', description: 'sec_event_types.auth.rfid.carddne').first_or_create
SecEventType.where(type_cd: 'RFIDDISABL', description: 'sec_event_types.auth.rfid.carddisabled').first_or_create
SecEventType.where(type_cd: 'RFIDSUCCES', description: 'sec_event_types.auth.rfid.accesssuccess').first_or_create

SecEventType.where(type_cd: 'LOGINPASS', description: 'sec_event_types.auth.web.loginsuccess').first_or_create
SecEventType.where(type_cd: 'LOGINFAIL', description: 'sec_event_types.auth.web.loginpwfail').first_or_create
SecEventType.where(type_cd: 'LOGINDNE', description: 'sec_event_types.auth.web.loginuserdne').first_or_create
SecEventType.where(type_cd: 'PASSRESET', description: 'sec_event_types.auth.web.loginpwreset').first_or_create

SecEventType.where(type_cd: 'NODEPASS', description: 'sec_event_types.auth.node.keypass').first_or_create
SecEventType.where(type_cd: 'NODEFAIL', description: 'sec_event_types.auth.node.keyfail').first_or_create

SecEventType.where(type_cd: 'NODECREATE', description: 'sec_event_types.node.create').first_or_create
SecEventType.where(type_cd: 'NODEUPDATE', description: 'sec_event_types.node.update').first_or_create
SecEventType.where(type_cd: 'NODEDESTROY', description: 'sec_event_types.node.destroy').first_or_create
