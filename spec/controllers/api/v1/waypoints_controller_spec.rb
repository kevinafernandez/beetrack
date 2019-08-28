require 'rails_helper'

RSpec.describe Api::V1::WaypointsController, type: :controller do
  describe 'POST #create' do
    let(:valid_params) {
      {
        waypoint: {
          latitude: -33.4054196,
          longitude: -70.606702,
          sent_at: '2019-08-26 11:00:00'
        },
        vehicle_identifier: 'CD-1250'
      }
    }

    context 'HTTP request' do
      it 'response should be succesful' do
        post :create, params: valid_params, format: :json
        expect(response).to have_http_status(:no_content)
      end
    end

    context 'with valid_attributes' do
      let!(:initial_waypoint) { Waypoint.count }

      it 'create a new waypoint' do
        expect {
          post :create, params: valid_params, as: :json
        }.to change { WaypointWorker.jobs.size }.by(1)
        Sidekiq::Worker.drain_all # execute all queues
        expect(Waypoint.count).to be(initial_waypoint + 1)
      end
    end

  end
end
