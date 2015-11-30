class NotificationsController < ApplicationController
  def show
    @link_url = params[:link_url]
  end

  def create
    NotificationsMailer.contact(email_params).deliver_now
    redirect_to :back, notice: "Email Sent!"
  end

  private

  def email_params
    params.permit(:name, :email, :message)
  end
end