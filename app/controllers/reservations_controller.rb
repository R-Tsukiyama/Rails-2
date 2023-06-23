class ReservationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @reservations = Reservation.where(user_id:current_user.id).inculdues(:user).order(id: "DESC")
  end

  def new
  end

  def confirm
    @reservaton = Reservation.new(reservaton_params)
    @room = Room.find(params[:room_id])
    if @reservation.invalid?
      render template: "rooms/show"
      return
    end
  end

  def create
    @reservation = Reservation.new(reservation_params)
    if @reservation.save
      flash[:notice] = "予約が完了しました"
      redirect_to reservations_path
    else
      flash[:alert] = "予約に失敗しました"
      redirect_to reservations_path
    end
  end

  def edit
    @reseravation = Reservation.find(params[:id])
    @room = Room.find(params[:room_id])
  end

  def update
    @reservation = Reservation.new(reservation_params)
    if @reservation.save
      flash[:notice] = "予約情報を更新しました"
      redirect_to reservations_path
    else
      render "edit"
    end
  end

  def destroy
    @reservation = Reservation.find(params[:id])
    @reservation.destroy
    flash[:notice] = "予約情報を削除しました"
    redirect_to reservations_path
  end

  private

  def reservation_params
    params.require(:reservation).permit(
      :user_id,
      :room_id,
      :check_in,
      :check_out,
      :people
    )
  end
end
