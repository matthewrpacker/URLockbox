class Api::V1::LinksController < ApplicationController
  def update
    link = Link.find(params[:id])
    if link.read
      link.update(read: false)
    else
      link.update(read: true)
    end
    link.save
  end
end
