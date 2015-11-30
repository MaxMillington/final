require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) do
    User.new(email: "steve@steve.com",
             password: "steve",
             password_confirmation: "steve")
  end

  it "is valid" do
    expect(user).to be_valid
  end

  it "is not valid when password is not confirmed" do
    user2 = User.new(email: "steve@steve.com",
                     password: "chuck",
                     password_confirmation: "charles")

    expect(user2).to be_invalid
  end

end