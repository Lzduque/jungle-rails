class RatingsController < ApplicationController
  before_filter :delete_rating, :only => [:destroy]
  before_filter :new_rating, :only => [:create]

  def create
    @rating.user = current_user
    @rating.product_id = params[:product_id]
    if @rating.save
      redirect_to product_path(params[:product_id])
    else
      redirect_to product_path(params[:product_id]) # :back
    end
  end

  def destroy
    @delete.destroy
    redirect_to product_path(@delete.product_id)
  end

  private
  def rating_params
    params.require(:rating).permit(:description, :rating)
  end

  protected
  def delete_rating
    @delete = Rating.find params[:id]
  end

  def new_rating
    @rating = Rating.new(rating_params)
  end
end
