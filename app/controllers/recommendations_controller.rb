class RecommendationsController < ApplicationController
  def new
    if params[:id]
      @link = Link.find(params[:id])
    else
      flash.now[:danger] = 'Provide an email address.'
      redirect_to :back
    end
  end

  def create
    link = Link.find(params[:id])
    email = params[:email]

    if email == ""
      flash.now[:danger] = 'Provide an email address.'
      redirect_to new_recommendation_path(link.id)
    else
      # binding.pry
      email_info= { email: params[:email], link: link.url }
      NotificationsMailer.contact(email_info).deliver_now
      flash.keep[:success] = 'Email sent.'
      redirect_to links_path
    end
  end
end