require 'rails_helper'

RSpec.describe 'Reservation controller routing spec', type: :routing do
  describe '#reserve' do
    it 'routes to the correct controller action' do
      expect(post('/reservation')).to route_to(
        controller: 'reservation',
        action: 'create'
      )
    end
  end
end