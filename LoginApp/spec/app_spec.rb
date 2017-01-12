# spec/app_spec.rb
require File.expand_path '../spec_helper.rb', __FILE__

describe "LoginApp" do
  it "should allow accessing the home page" do
  	get("/")
    # Rspec 2.x
    expect(last_response).to be_ok
  end
  it "should not allow accessing the profile without login" do
    get '/profile'
    # Rspec 2.x
    expect(last_response).not_to be_redirect
  end
end