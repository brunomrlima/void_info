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
  end

  context 'scope tests' do
    let (:params) { {email: "valid@email"} }

    before(:each) do
      Email.new(params).save
      Email.new(params).save
      Email.new(params.merge(subscription: false)).save
      Email.new(params.merge(subscription: true)).save
      Email.new(params.merge(subscription: true)).save
    end

    it 'should return subscribed users' do
      expect(Email.subscribed.size).to eq(2)
    end
    it 'should return users not subscribed' do
      expect(Email.not_subscribed.size).to eq(3)
    end
  end

end
