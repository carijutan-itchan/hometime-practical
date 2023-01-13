module ReservationHelper
  extend ActiveSupport::Concern

  def build_params
    @params = {
                code: set_code_params,
                start_date: set_start_date_params,
                end_date: set_end_date_params,
                adults: set_adults_params,
                children: set_children_params,
                infants: set_infants_params,
                status: set_status_params,
                currency: set_currency_params,
                payout_price: set_payout_price_params,
                security_price: set_security_price_params,
                total_price: set_total_price_params,
                nights: set_nights_params,
                guests: set_guests_params,
                guest: {
                  first_name: set_first_name_params,
                  last_name: set_last_name_params,
                  email: set_email_params,
                  phone: set_phone_params
                }

    }
  end

  def check_reservation
    @reservation =  Reservation.find_by(code: set_code_params)
  end

  def check_guest
    @guest = Guest.find_by(email: guest_params[:email])
  end

  private

  def set_code_params
    params["reservation_code"] || params["reservation"]["code"]
  end

  def set_adults_params
    params["adults"] || params["reservation"]["guest_details"]["number_of_adults"]
  end

  def set_children_params
    params["children"] || params["reservation"]["guest_details"]["number_of_children"]
  end

  def set_infants_params
    params["infants"] || params["reservation"]["guest_details"]["number_of_infants"]
  end

  def set_status_params
    params["status"] || params["reservation"]["status_type"]
  end

  def set_currency_params
    params["currency"] || params["reservation"]["host_currency"]
  end

  def set_payout_price_params
    params["payout_price"] || params["reservation"]["expected_payout_amount"] 
  end

  def set_security_price_params
    params["security_price"] || params["reservation"]["listing_security_price_accurate"]
  end

  def set_total_price_params
    params["total_price"] || params["reservation"]["total_paid_amount_accurate"]
  end

  def set_nights_params
    params["nights"] || params["reservation"]["nights"]
  end

  def set_guests_params
    params["guests"] || params["reservation"]["number_of_guests"]
  end

  def set_start_date_params
    params["start_date"] || params["reservation"]["start_date"]
  end

  def set_end_date_params
    params["end_date"] || params["reservation"]["end_date"]
  end

  def set_first_name_params
    if params["guest"].nil?
      params["reservation"]["guest_first_name"]
    else
      params["guest"]["first_name"]
    end
  end

  def set_last_name_params
    if params["guest"].nil?
      params["reservation"]["guest_last_name"]
    else
      params["guest"]["last_name"] 
    end
  end

  def set_email_params
    if params["guest"].nil?
      params["reservation"]["guest_email"]
    else
      params["guest"]["email"]
    end
  end

  def set_phone_params
    if params["guest"].nil?
      params["reservation"]["guest_phone_numbers"]
    else
      params["guest"]["phone"]
    end
  end
end