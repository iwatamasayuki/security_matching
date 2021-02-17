class GuardsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_guard, only: [:edit, :show, :update, :destroy]

  def index
    @guards = Guard.all.order('created_at DESC')
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

  private

  def guard_params
    params.require(:guard).permit(:company, :image, :guard_name, :name_kana, :gender, :age, :experience, :qualification).merge(user_id: current_user.id)
  end

  def set_guard
    @guard = Guard.find(params[:id])
  end
end
