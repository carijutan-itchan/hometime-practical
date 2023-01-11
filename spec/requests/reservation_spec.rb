require 'rails_helper'

RSpec.describe "Reservations endpoint", type: :request do
  describe "POST /reservation with booking payload" do

    subject do
      post reservations_path, params: params
      response
    end

    let(:reservation_code) { '2123ABSC' }
    let(:start_date) { '2023-01-14' }
    let(:end_date) { '2023-01-20' }
    let(:nights) { 6 }
    let(:guests) { 2 }
    let(:adults) { 2 }
    let(:children) { 0 }
    let(:infants) { 0 }
    let(:guest) { 
      { 
        first_name: 'Emman',
        last_name: 'Borrico',
        email: 'emmanborrico@gmail.com',
        contact: '0959499231',
      }
    }
    let(:currency) { 'AUD' }
    let(:payout_price) { 20 }
    let(:security_price) { 50 }
    let(:total_price) { 70 }
    let(:code) { '2025ARTT' }
    let(:expected_payout_amount) { 500 }
    let(:guest_details) {
      {
        localized_description: 'test',
        number_of_adults: 6,
        number_of_children: 0,
        number_of_infants: 0
      }  
    }
    let(:guest_email) { 'borrico-emman@gmail.com' }
    let(:guest_first_name) { 'Don' }
    let(:guest_last_name) { 'Bosco' }
    let(:guest_phone_numbers) { [ '09493981353', '09493912331' ] }
    let(:listing_security_price_accurate) { 1400 }
    let(:host_currency) { 'AED' }
    let(:number_of_guests) { 6 }
    let(:status_type) { 'accepted' }
    let(:total_paid_amount_accurate) { 1900 }

    let(:params) {
      {
        reservation_code: reservation_code,
        start_date: start_date,
        end_date: end_date,
        nights: nights,
        guests: guest,
        adults: adults,
        children: children,
        infants: infants,
        status: status,
        guest: guest,
        currency: currency,
        payout_price: payout_price,
        security_price: security_price,
        total_price: total_price,
        # reservation: {
        #   code: code,
        #   start_date: start_date,
        #   end_date: end_date,
        #   expected_payout_amount: expected_payout_amount,
        #   guest_details: guest_details,
        #   guest_email: guest_email,
        #   guest_first_name: guest_first_name,
        #   guest_last_name: guest_last_name,
        #   guest_phone_numbers: guest_phone_numbers,
        #   listing_security_price_accurate: listing_security_price_accurate,
        #   host_currency: host_currency,
        #   nights: nights,
        #   number_of_guests: number_of_guests,
        #   status_type: status_type,
        #   total_paid_amount_accurate: total_paid_amount_accurate
        # }
      }
    }

    it "test" do
      
    end
  end
end
