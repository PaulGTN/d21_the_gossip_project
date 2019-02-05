require 'rails_helper'

RSpec.describe User, type: :model do

  context "validation" do
    it "is valid with valid attributes" do
    	city = FactoryBot.create(:city)
    	user = FactoryBot.create(:user, city: city)
      expect(user).to be_a(User)
      expect(user).to be_valid
    end
  	describe "#first_name" do
  	  it "should not be valid without first_name" do
  	    bad_user = User.create(last_name: "Bon")
  	    expect(bad_user).not_to be_valid
  	    expect(bad_user.errors.include?(:first_name)).to eq(true)
  	  end
  	end
  end

end