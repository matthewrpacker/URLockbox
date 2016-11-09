class LinksController < ApplicationController
  def index
    @links = current_user.links.order(id: :desc)
    @link = Link.new
  end

  def create
    @link = Link.new(user_id: current_user.id, title: link_params[:title], url: link_params[:url])
    @user = User.find(params[:user_id])
    if @link.save
      flash[:success] = "Link Created!!"
      redirect_to user_links_path(current_user)
    else
      redirect_to user_links_path(current_user)
      flash[:danger] = "Invalid URL."
    end
  end

  def edit
    @link = Link.find(params[:id])
  end

  def update
    @link = Link.find(params[:id])

    if @link.update_attributes(link_params)
      redirect_to user_links_path(current_user)
      flash[:success] = "Link Updated!"
    else
      flash[:danger] = "Invalid URL."
      render :edit
    end
  end

  private

  def link_params
    params.require(:link).permit(:title, :url)
  end
end
