require 'rails_helper'

RSpec.describe "the signin process", type: :model do
  before :each do
    User.new(email: 'gordon@chef.com', password: 'asdasd')
end

  it "signs in" do
    	'/sessions/new'
    within("#session") do
      	fill_in 'Email', with: 'user@example.com'
      	fill_in 'Password', with: 'password'
    end
  end
end