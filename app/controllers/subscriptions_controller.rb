class SubscriptionsController < ApplicationController
  def create
    # render text: params
    if current_user
    @subscription = Subscription.create(user_id: params[:user_id], video_id: params[:video_id])
    redirect_to :back, notice: "New video was successfully added to your list"
    else
      redirect_to :back, notice: "You should login first"
    end
  end


  def destroy
    @subscription = Subscription.find_by(user_id: params[:user_id], video_id: params[:video_id])
    @subscription.destroy
    redirect_to :back, notice: "Video was successfully removed from your list"
  end
end
