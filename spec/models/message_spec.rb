require 'rails_helper'

RSpec.describe Message, type: :model do
  it "is valid with valid attributes" do
    expect(Message.new).to be_valid
  end

  it "is invalid if content is nil"
end
