require 'rails_helper'

RSpec.describe 'Reservation controller routing spec', type: :routing do
  describe '#reserve' do
    it 'routes to the correct controller action' do
      expect(post('/reserve')).to route_to(
        controller: 'reservation',
        action: 'reserve'
      )
    end
  end
end