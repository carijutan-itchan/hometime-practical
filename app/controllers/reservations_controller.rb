class ReservationsController < ApplicationController
  include ReservationHelper
  
  before_action :build_params
  before_action :check_reservation
  before_action :check_guest
  
  def create
    service = ReservationService.new(params: @params, reservation: @reservation, guest: @guest)
    reservation = service.execute

    render json: {
      data: ActiveModelSerializers::SerializableResource.new(reservation, serializer: ReservationsSerializer),
      message: 'Reserved Successfully!',
      status: 200,
      type: 'Success'
    }
  end

  private

  def booking_params
    params.permit(:reservation_code, 
                  :start_date, 
                  :end_date, 
                  :adults, 
                  :children, 
                  :infants, 
                  :status,
                  :currency,
                  :payout_price, 
                  :security_price, 
                  :total_price, 
                  :nights, 
                  :guests,
                  guest: [:first_name, :last_name, :email, :phone]
                )
  end

  def airbnb_params
    params.require(:reservation).permit(
      :code, :start_date, :end_date,
      :expected_payout_amount,
      :guest_email, 
      :guest_first_name, 
      :guest_last_name,  
      :listing_security_price_accurate,
      :host_currency, 
      :nights, 
      :number_of_guests, 
      :status_type, 
      :total_paid_amount_accurate,
      guest_details: [:localized_description, :number_of_adults, :number_of_children, :number_of_infants],
      :guest_phone_numbers => [],
    )
  end
end
