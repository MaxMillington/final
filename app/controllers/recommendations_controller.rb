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
      # email_info= { email: params[:email], link: link.url }
      flash.keep[:success] = 'Email sent.'
      redirect_to links_path
    end
  end
end