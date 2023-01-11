module ReservationHelper
  extend ActiveSupport::Concern

  def set_params
    @params = if params["reservation_code"].nil?
                airbnb_params
              else
                booking_params
              end
  end

  def check_reservation
    code = if params["reservation_code"].nil?
            params["reservation"]["code"]
          else
            params["reservation_code"]
          end 

    @reservation =  Reservation.find_by(code: code)
  end

end