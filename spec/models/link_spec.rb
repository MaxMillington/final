require 'rails_helper'

RSpec.describe Link, type: :model do
  let(:link) do
    Link.new(title: "Wildwood",
             url: "http://www.wildwoodguitars.com")
  end

  let(:invalid_link) do
    Link.new(title: "dumb",
             url: "durmb")
  end

  it "is valid" do
    expect(link).to be_valid
  end

  it "is invalid" do
    expect(invalid_link).to_not be_valid
  end

  it "default false read status" do
    expect(link.read).to eq(false)
  end
end