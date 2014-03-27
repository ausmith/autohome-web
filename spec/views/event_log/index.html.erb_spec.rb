require 'spec_helper'

describe "event_log/index.html.erb" do
  it "has a title" do
    render
    assert_select "h1", text: "Security Events", count: 1
  end

  it "shows an info message when no events exist" do
    render
    assert_select "div.alert.alert-info", text: "No security events match your current criteria.", count: 1
  end

  it "shows a table when events exist" do
    events = [
      stub_model(SecEvent,
                sec_event_type: stub_model(SecEventType,
                                       type_cd: "LOGINPASS",
                                       description: 'sec_event_types.auth.web.loginsuccess')
                )
    ]

    events.stub(:current_page).and_return(1)
    events.stub(:total_pages).and_return(1)
    events.stub(:limit_value).and_return(1)

    assign(:events, events)

    render

    assert_select "div.alert.alert-info", text: "No security events match your current criteria.", count: 0
    assert_select "th", text: "Date", count: 1
    assert_select "th", text: "User", count: 1
    assert_select "th", text: "Description", count: 1
  end
end
