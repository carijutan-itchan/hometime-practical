class ReservationsController < ApplicationController
  before_action :set_params

  def create
    service = ReservationService.new(params: @params)
    reservation = service.execute

    render json: {
      data: ActiveModelSerializers::SerializableResource.new(reservation, serializer: ReservationsSerializer),
      message: ['Reserved Successfully!'],
      status: 200,
      type: 'Success'
    }
  end

  private

  def set_params
    @params = if params["reservation_code"].nil?
                airbnb_params
              else
                booking_params
              end
  end

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
