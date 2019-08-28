require 'rails_helper'

RSpec.describe Waypoint, type: :model do

  subject { described_class.new }

  describe 'associations' do
    it { should belong_to :vehicle }
  end

  describe 'validations' do
    let(:valid_attributes) {
      {
        latitude: -33.4054196,
        longitude: -70.606702,
        sent_at: '2019-08-26 11:00:00'
      }
    }

    let(:invalid_attributes) {
      {
        latitude: nil,
        longitude: nil,
        sent_at: nil
      }
    }

    let(:vehicle) { Vehicle.create(identifier: 'AB-1234') }

    it 'should not be valid without attributes' do
      subject.attributes = invalid_attributes
      expect(subject).to_not be_valid
    end

    it 'should be valid with attributes' do
      subject.vehicle = vehicle
      subject.attributes = valid_attributes
      expect(subject).to be_valid
    end
  end

end
