require 'spec_helper'

describe "users/show.html.erb" do
  before(:each) do
    @user = assign(:user,
           stub_model(User,
                      :user_id => 1,
                      :first_name => "Johnny",
                      :last_name => "Dough",
                      :email => "johnny.dough@example.com",
                      :admin => false
                     )
          )

    my_current_user = stub_model(User,
                                        :user_id => 22,
                                        :first_name => "Adminie",
                                        :last_name => "Usermon",
                                        :email => "rooty@example.org",
                                        :admin => false
                                       )

    view.stub(:current_user).and_return(my_current_user)
  end

  it "has a header" do
    render
    assert_select "h1", :text => "User Profile: Johnny Dough".to_s, :count => 1
  end

  it "has a link to \"Access Controls\"" do
    render
    assert_select "tr>td>a", :text => "Access Controls".to_s, :count => 1
  end

  it "shows the first name" do
    render
    assert_select "td", :text => "First Name:".to_s, :count => 1
  end

  it "shows the last name" do
    render
    assert_select "td", :text => "Last Name:".to_s, :count => 1
  end

  it "shows the email address" do
    render
    assert_select "td", :text => "Email:".to_s, :count => 1
  end

  it "shows the admin status" do
    render
    assert_select "td", :text => "Is Admin:".to_s, :count => 1
  end

  it "shows the deleted date when the user is deleted and the user is an admin" do
    my_current_user = stub_model(User,
                                  :user_id => 22,
                                  :first_name => "Adminie",
                                  :last_name => "Usermon",
                                  :email => "rooty@example.org",
                                  :admin => true
                                )
    @user = assign(:user, stub_model(User,
                              :user_id => 1,
                              :first_name => "Johnny",
                              :last_name => "Dough",
                              :email => "johnny.dough@example.com",
                              :admin => false,
                              :deleted_at => Time.now
                              )
                  )


    view.stub(:current_user).and_return(my_current_user)
    render
    assert_select "td", :text => "Date Deleted:".to_s, :count => 1
  end

  it "shows the edit link when the users match" do
    view.stub(:current_user).and_return(@user)
    render
    assert_select "a", :text => "Edit Profile".to_s, :count => 1
  end

  it "shows the edit link when the current user is an admin" do
    my_current_user = stub_model(User,
                                  :user_id => 22,
                                  :first_name => "Adminie",
                                  :last_name => "Usermon",
                                  :email => "rooty@example.org",
                                  :admin => true
                                )

    view.stub(:current_user).and_return(my_current_user)
    render
    assert_select "a", :text => "Edit Profile".to_s, :count => 1
  end

  it "hides the edit link when not an admin or the same user" do
    my_current_user = stub_model(User,
                                  :user_id => 22,
                                  :first_name => "Notadminie",
                                  :last_name => "Usermon",
                                  :email => "notarooty@example.org",
                                  :admin => false
                                )

    view.stub(:current_user).and_return(my_current_user)
    render
    assert_select "a", :text => "Edit Profile".to_s, :count => 0
  end
end
