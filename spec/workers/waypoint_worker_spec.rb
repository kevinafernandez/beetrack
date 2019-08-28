require 'rails_helper'

RSpec.describe WaypointWorker, type: :worker do

  describe 'Test worker' do
    let(:waypoints_params) {
      {
        waypoint: {
          latitude: -33.4054196,
          longitude: -70.606702,
          sent_at: '2019-08-26 11:00:00'
        }
      }
    }
    let(:vehicle_params) { { vehicle_identifier: 'CD-1250' } }

    it 'should increase jobs' do
      WaypointWorker.perform_async(waypoints_params, vehicle_params)
      expect(WaypointWorker.jobs.size).to eq(1)
    end

  end

end
