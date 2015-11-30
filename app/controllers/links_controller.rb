class LinksController < ApplicationController

  def new

  end

  def index
    if current_user
      @links = current_user.links
    else
      @links = []
    end
    @link = Link.new
  end

  def create
    @link = current_user.links.new(link_params)

    if @link.save
      redirect_to links_path
    else
      flash.keep[:danger] = 'You must enter a title and valid url'
      redirect_to links_path
    end
  end

  def update
    @link = Link.find(params[:id])

    if @link.update(link_params)
      redirect_to links_path
    else
      flash.keep[:danger] = 'You must enter a title and valid url'
      redirect_to edit_link_path(@link.id)
    end
  end

  def edit
    @link = Link.find(params[:id])
  end

  private

  def link_params
    params.require(:link).permit(:title, :url, :read)
  end

end