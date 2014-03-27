require 'spec_helper'

# Specs in this file have access to a helper object that includes
# the NodesHelper. For example:
#
# describe NodesHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       helper.concat_strings("this","that").should == "this that"
#     end
#   end
# end
describe UsersHelper do
  describe "get_user_link" do
    it "outputs \"-\" when the user is empty" do
      get_user_link(nil).should == '-'
    end

    it "outputs a link to a user when the user is not empty" do
      user = stub_model(User, first_name: "RSpec", last_name: "User", id: 321)

      get_user_link(user).should == link_to(user.display_full_name, user)
    end
  end
end
