class GuardsController < ApplicationController

  def index
    @guards = Guard.all
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
    @guard = Guard.find(params[:id])
  end

  private

  def guard_params
    params.require(:guard).permit(:company, :guard_name, :name_kana, :gender, :age, :experience, :qualification).merge(user_id: current_user.id)
  end
end
