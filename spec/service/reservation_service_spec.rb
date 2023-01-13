require 'rails_helper'

describe ReservationService, type: :service do
  subject { service.execute }
  let(:service) { described_class.new(params: params, reservation: reservation, guest: guest) }

  let(:reservation) { nil }
  let(:guest) { nil }
  let(:params) {
   {
    code: code,
    start_date: start_date,
    end_date: end_date,
    adults: adults,
    children: children,
    infants: infants,
    status: status,
    currency: currency,
    payout_price: payout_price,
    security_price: security_price,
    total_amount: total_price,
    nights: nights,
    guests: guests,
    guest: {
      first_name: guest_params[:first_name],
      last_name: guest_params[:last_name],
      email: guest_params[:email],
      contact: guest_params[:contact]
    }
    }
  }

  let(:code) { '2123ABSC' }
  let(:start_date) { '2023-01-14' }
  let(:end_date) { '2023-01-20' }
  let(:nights) { 6 }
  let(:guests) { 2 }
  let(:adults) { 2 }
  let(:children) { 0 }
  let(:infants) { 0 }
  let(:payout_price) { 20 }
  let(:security_price) { 50 }
  let(:total_price) { 70 }
  let(:currency) { 'AUD' }
  let(:status) { 'pending' }
  let(:guest_params) { 
    { 
      first_name: 'Emman',
      last_name: 'Borrico',
      email: 'emmanborrico@gmail.com',
      contact: '0959499231',
    }
  }


  describe '#execute' do
    context 'Guest does not exist yet on model' do

      it 'should create a new guest data' do
        expect {
          expect(subject.errors.size).to eq 0
        }.to change(Guest, :count).by(1)
      end

      it 'should create a new reservation data' do
        expect {
          expect(subject.errors.size).to eq 0
        }.to change(Reservation, :count).by(1)
      end
    end
  end
end