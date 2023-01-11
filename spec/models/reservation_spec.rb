require 'rails_helper'

RSpec.describe Reservation, type: :model do

  subject do
    Reservation.create(code: code,
                       status: status,
                       currency: currency,
                       adults: adults,
                       children: children,
                       infants: infants,
                       total_amount: total_amount,
                       start_date: start_date,
                       end_date: end_date,
                       guest_id: guest.id,
                       security_price: security_price,
                       payout_price: payout_price,
                       nights: nights,
                       guests: guests
                      )
  end

  let(:guest) {
    Guest.create(first_name: 'Emman',
                 last_name: 'Borrico',
                 email: 'emmanborrico@gmail.com',
                 contact: '0959499231')
  }

  let(:code) { '2023ABCD' }
  let(:status) { 'pending' }
  let(:currency) { 'AED' }
  let(:adults) { 2 }
  let(:children) { 0 }
  let(:infants) { 0 }
  let(:nights) { 5 }
  let(:guests) { 2 }
  let(:security_price) { 50 }
  let(:payout_price) { 50 }
  let(:total_amount) { 100.00 }
  let(:start_date) { '2023-01-5' }
  let(:end_date) { '2023-01-10' }

  context "#validate" do
    it "is valid attributes" do 
      expect(subject).to be_valid
    end

    context "code with empty value" do
      let(:code) { ' ' }

      it "should not valid" do
        expect(subject).not_to be_valid
      end
    end

    context "code with nil value" do
      let(:code) { nil }
      
      it "should not valid" do
        expect(subject).not_to be_valid
      end
    end

    context "status with empty value" do
      let(:status) { ' ' }

      it "should not valid" do
        expect(subject).not_to be_valid
      end
    end

    context "status with nil value" do
      let(:status) { nil }
      
      it "should not valid" do
        expect(subject).not_to be_valid
      end
    end

    context "curremcy with empty value" do
      let(:currency) { ' ' }

      it "should not valid" do
        expect(subject).not_to be_valid
      end
    end

    context "currency with nil value" do
      let(:currency) { nil }
      
      it "should not valid" do
        expect(subject).not_to be_valid
      end
    end

    context "total_amount with empty value" do
      let(:total_amount) { ' ' }

      it "should not valid" do
        expect(subject).not_to be_valid
      end
    end

    context "total_amount with nil value" do
      let(:total_amount) { nil }
      
      it "should not valid" do
        expect(subject).not_to be_valid
      end
    end

    context "adults with empty value" do
      let(:adults) { ' ' }

      it "should not valid" do
        expect(subject).not_to be_valid
      end
    end

    context "adults with nil value" do
      let(:adults) { nil }
      
      it "should not valid" do
        expect(subject).not_to be_valid
      end
    end

    context "start_date with empty value" do
      let(:start_date) { ' ' }

      it "should not valid" do
        expect(subject).not_to be_valid
      end
    end

    context "start_date with nil value" do
      let(:start_date) { nil }
      
      it "should not valid" do
        expect(subject).not_to be_valid
      end
    end

    context "end_date with empty value" do
      let(:end_date) { ' ' }

      it "should not valid" do
        expect(subject).not_to be_valid
      end
    end

    context "end_date with nil value" do
      let(:end_date) { nil }
      
      it "should not valid" do
        expect(subject).not_to be_valid
      end
    end

    context "total_amount with negative value" do
      let(:total_amount) { -1 }

      it "should not valid" do
        expect(subject).not_to be_valid
      end
    end

    context "total_amount with greater than zero value" do
      let(:total_amount) { 100 }

      it "should not valid" do
        expect(subject).to be_valid
      end
    end

    context "duplicate code number" do

      before { subject }
      
      let(:reservation) {
            Reservation.create(code: code,
              status: status,
              currency: currency,
              adults: adults,
              children: children,
              infants: infants,
              total_amount: total_amount,
              start_date: start_date,
              end_date: end_date,
              guest_id: guest.id,
              security_price: security_price,
              payout_price: payout_price,
              nights: nights,
              guests: guests).save
      }
      let(:code) { '2023ABCD' }

      it "is not valid code" do
        expect(reservation).to eq(false)
      end
    end

    context "when end_date is before start date" do
      let(:end_date) { '2023-01-01' }
      let(:start_date) { '2023-01-05' }

      it "is not valid duration" do
        expect(subject).not_to be_valid
      end
    end  
  end
end
