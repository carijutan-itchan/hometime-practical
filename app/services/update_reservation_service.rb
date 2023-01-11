class UpdateReservationService
  def initialize(params:, reservation:)
    @params = params
    @reservation = reservation
  end

  def execute   
    ActiveRecord::Base.transaction do
      guest = @reservation.guest
      if guest.update guest_params
        reservation = guest.reservations.update host_params
      end     
    end

    @reservation.reload
    @reservation
  end

  private

  def host_params
    if @params["reservation_code"].nil?
      {
        start_date: @params['start_date'], 
        end_date: @params['end_date'],
        adults: @params["guest_details"]["number_of_adults"],
        children: @params["guest_details"]["number_of_children"],
        infants: @params["guest_details"]["number_of_infants"],
        status: @params['status_type'],
        currency: @params['host_currency'],
        # payout_price: @params['expected_payout_amount'], 
        # security_price: @params['listing_security_price_accurate'], 
        total_amount: @params['total_paid_amount_accurate'], 
        # nights: @params['nights'], 
        # guests: @params['number_of_guests'],
      }
    else
      {
        start_date: @params['start_date'], 
        end_date: @params['end_date'],
        adults: @params['adults'],
        children: @params['children'],
        infants: @params['infants'],
        status: @params['status'],
        currency: @params['currency'],
        # payout_price:, 
        # security_price:, 
        total_amount: @params['total_price'], 
        # nights:, 
        # guests:,
      }
    end
  end

  def guest_params
    if !@params["reservation_code"].nil?
      {
        first_name: @params['guest']['first_name'], 
        last_name: @params['guest']['last_name'], 
        contact: @params['guest']['phone']
      }
    else
      {
        first_name: @params['guest_first_name'], 
        last_name: @params['guest_last_name'], 
        contact: @params['guest_phone_numbers'],
      }
    end
  end

  attr_reader :params
  attr_accessor :reservation
end