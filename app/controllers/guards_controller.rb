class GuardsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_guard, only: [:edit, :show, :update, :destroy]
  before_action :search_product, only: [:index, :search]

  def index
    @guards = Guard.includes(:user).order('created_at DESC')
    set_guard_column
  end

  def new
    @guard = Guard.new
  end

  def create
    @guard = Guard.new(guard_params)
    if @guard.valid?
      @guard.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def show
    @message = Message.new
    @messages = @guard.messages.includes(:user)
  end

  def edit
  end

  def update
    if @guard.update(guard_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @guard.destroy
    redirect_to root_path
  end

  def search
    @results = @g.result
  end

  private

  def guard_params
    params.require(:guard).permit(:company, :image, :guard_name, :name_kana, :gender, :age, :experience, :qualification).merge(user_id: current_user.id)
  end

  def set_guard
    @guard = Guard.find(params[:id])
  end

  def search_product
    @g = Guard.ransack(params[:q])
  end

  def set_guard_column
    @guard_name = Guard.select("guard_name").distinct
    @gender = Guard.select("gender").distinct
    @qualification = Guard.select("qualification").distinct
  end

end
