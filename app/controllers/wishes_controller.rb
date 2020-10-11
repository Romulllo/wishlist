class WishesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_user, only: [:edit, :update, :destroy, :show]
  before_action :validate_user, only: [:edit, :update, :destroy, :show]
  
  def index
    @wishes = current_user.wishes.order(:priority).reverse
  end

  def new
    @wish = Wish.new
  end

  def create
    @wish = Wish.new(wish_params)
    if @wish.save
      redirect_to wishes_path
    else
      redirect_to :new
    end
  end

  def edit
  end

  def update
    if @wish.update(wish_params)
      redirect_to wishes_path
    else
      redirect_to :edit
    end
  end

  def destroy
    @wish.delete
    redirect_to wishes_path
  end

  def show
  end


  private

  def wish_params
    params.require(:wish).permit( :title, :description, :url, :priority ).merge(user_id: current_user.id)
  end

  def validate_user
    redirect_to wishes_path if @wish.user != current_user    
  end

  def find_user
    @wish = Wish.find(params[:id])
  end
end