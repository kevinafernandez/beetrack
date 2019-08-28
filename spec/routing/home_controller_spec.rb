require 'rails_helper'

RSpec.describe HomeController, type: :routing do

  describe 'routes' do
    it 'should go to #show' do
      expect(get: '/show').to route_to('home#show')
    end
  end

end
