class RoomsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]

  def index
    @rooms = current_user.rooms #ログイン中のユーザーの情報のみ
  end

  def new
    @room = current_user.rooms.new
  end

  def create
    @room = current_user.rooms.new(room_params)
    if @room.save
      flash[:notice] = "宿泊施設を登録しました"
      redirect_to  @room
    else
      flash[:failure] = "問題が発生しました"
      render :new
    end
  end

  def show
    @user = current_user
    @room = Room.find(params[:id])
  end

  def edit
    @room = Room.find(params[:id])
  end

  def update
    @room = Room.find(params[:id])
    if @room.update(room_params)
      flash[:notice] = "宿泊施設を更新しました"
      redirect_to @room
    else
      flash[:failure] = "問題が発生しました"
      render :edit
    end
  end
 
  def destroy
    @room = Room.find(params[:id])
    @room.destroy
    flash[:notice] = "宿泊施設を削除しました"
    redirect_to :rooms
  end

  def search
  end

  private
  def room_params
    params.require(:room)
    .permit(
      :name,
      :introduction,
      :price,
      :address,
      :image,
    )
    .merge(
      user_id :current_user.id
    )
    #mergeメソッド・・・ユーザーのidを直接入力しないがパラメーターに含めてDBの保存ができる。
end
