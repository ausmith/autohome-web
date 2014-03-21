Given /^at least one room exists$/ do
  r = Room.first;
  
  if( r == nil )
    r = Room.new
    r.id = 1
    r.name = "room1"
    r.save  
  end
end