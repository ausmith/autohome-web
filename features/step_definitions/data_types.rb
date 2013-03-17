Given /^I have a data_type named "(.*?)" with shorthand "(.*?)"$/ do |longhand, shorthand|
  d = DataType.new
  d.longhand_unit = longhand
  d.shorthand_unit = shorthand

  d.should be_valid
  d.save
end

