require 'rails_helper'

RSpec.describe Email, type: :model do

  context 'relations' do
    it "has many preferences" do
      should respond_to(:preferences)
    end
    it "accepts nested attributes for preferences" do
      should accept_nested_attributes_for :preferences
    end
  end

  context 'validation tests' do
    it 'ensures emails presence' do
      email = Email.new.save
      expect(email).to eq(false)
    end
    it 'ensures emails format' do
      email = Email.new(email: "invalid").save
      expect(email).to eq(false)
    end
    it 'ensures emails uniqueness' do
      should validate_uniqueness_of(:email)
    end
  end

  context 'scope tests' do
    before(:each) do
      Email.create(email: "valid1@email")
      Email.create(email: "valid2@email")
      Email.create(email: "valid3@email")
      Email.create(email: "valid4@email", subscription: false)
      Email.create(email: "valid5@email", subscription: true)
      Email.create(email: "valid6@email", subscription: true)
    end

    it 'should return subscribed users' do
      expect(Email.subscribed.size).to eq(2)
    end
    it 'should return users not subscribed' do
      expect(Email.not_subscribed.size).to eq(4)
    end
  end

  context 'methods' do
    before(:each) do
      @email_subscribed = Email.create(email: "valid@email", subscription: true)
      @email_not_subscribed = Email.create(email: "valid2@email")
    end
    it '#is_subscribed?' do
      expect(@email_subscribed.is_subscribed?).to eq(true)
      expect(@email_not_subscribed.is_subscribed?).to eq(false)
    end

    it '#is_new_email?' do
      new_email = Email.new(email: "another_valid@email")
      expect(@email_subscribed.is_new_email?).to eq(false)
      expect(new_email.is_new_email?).to eq(true)
    end

  end

end
