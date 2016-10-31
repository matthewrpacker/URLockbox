class LinksController < ApplicationController
  def index
    @links = current_user.links
    @link = Link.new
  end

  def create
    @link = Link.new(user_id: current_user.id, title: link_params[:title], url: link_params[:url])
    @user = User.find(params[:user_id])
    if @link.save
      @link.update(user_id: @user.id)
      flash[:notice] = "Link Created!!"
      redirect_to user_links_path(current_user)
    else
      redirect_to user_links_path(current_user)
      flash[:notice] = "Invalid URL."
    end
  end

  def edit
    @link = Link.find(params[:id])
  end

  def change
    @link = Link.find(params[:link_id])
    @link.read ? @link.update(read: false) : @link.update(read: true)
    @link.save
    redirect_to user_links_path(current_user)
  end

  def update
    @link = Link.find(params[:id])

    if @link.update_attributes(link_params)
      redirect_to user_links_path(current_user)
    else
      flash[:notice] = "Invalid URL."
      render :edit
    end
  end

  private

  def link_params
    params.require(:link).permit(:title, :url)
  end
end
