require 'rails_helper'

RSpec.describe Vehicle, type: :model do
  subject { described_class.new }

  describe 'associations' do
    it { should have_many :waypoints }
  end

  describe 'uniqueness' do
    it { should validate_uniqueness_of(:identifier).case_insensitive }
  end

  describe 'validations' do
    let(:valid_attributes) { { identifier: 'YZ-9876' } }

    let(:invalid_attributes) { { identifier: nil } }

    it 'should not be valid without attributes' do
      subject.attributes = invalid_attributes
      expect(subject).to_not be_valid
    end

    it 'should be valid with attributes' do
      subject.attributes = valid_attributes
      expect(subject).to be_valid
    end

    it 'should be valid assigning a waypoint' do
      waypoint = Waypoint.new(latitude: -35.7512797, longitude: -71.266702, sent_at: '2019-08-22 11:00:00')
      subject.waypoints << waypoint
      subject.attributes = valid_attributes
      expect(subject).to be_valid
    end
  end

end
