require 'rails_helper'

RSpec.describe Preference, type: :model do
  context 'relations' do
    it "belongs to email" do
      should respond_to(:email)
    end

    it "belongs to country" do
      should respond_to(:country)
    end
  end

  context 'validation tests' do
    it 'ensures country_id presence' do
      preference = Preference.new.save
      expect(preference).to eq(false)
    end
  end
end
