class ReservationService
  def initialize(params:, reservation:, guest:)
    @params = params
    @reservation = reservation
    @guest = guest
  end

  def execute
    ActiveRecord::Base.transaction do
      if @guest.nil?
        create_guest
        create_reservation
      elsif @guest && @reservation.nil?
        update_guest
        create_reservation
      else
        update_guest
        update_reservation
      end
    end
    
    @reservation
  end

  def create_reservation
    @reservation = @guest.reservations.new host_params
    @reservation.save!
  end

  def create_guest
    @guest = Guest.new guest_params
    @guest.save!
  end

  def update_reservation
    reservation = @guest.reservations&.find(@reservation.id)
    reservation.attributes = host_update_params
    reservation.save!
    @reservation = reservation
  end

  def update_guest
    @guest.attributes = guest_params
    @guest.save!
  end

  private

  def host_params
    {
      code: params[:code], 
      start_date: params[:start_date], 
      end_date: params[:end_date],
      adults: params[:adults],
      children: params[:children],
      infants: params[:infants],
      status: params[:status],
      currency: params[:currency],
      payout_price: params[:payout_price], 
      security_price: params[:security_price], 
      total_amount: params[:total_amount], 
      nights: params[:nights], 
      guests: params[:guests]
    }
  end

  def guest_params
    {
      first_name: params[:guest][:first_name], 
      last_name: params[:guest][:last_name], 
      email: params[:guest][:email], 
      contact: params[:guest][:contact]
    }
  end

  def host_update_params
    {
      start_date: params[:start_date], 
      end_date: params[:end_date],
      adults: params[:adults],
      children: params[:children],
      infants: params[:infants],
      status: params[:status],
      currency: params[:currency],
      payout_price: params[:payout_price], 
      security_price: params[:security_price], 
      total_amount: params[:total_amount], 
      nights: params[:nights], 
      guests: params[:guests]
    }
  end

  attr_reader :params
  attr_accessor :reservation, :guest
end