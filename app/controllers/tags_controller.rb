class TagsController < ApplicationController

  def new
  end

  def create
    @tag = Tag.create!(params[:tag])

    render :nothing => true
  end




end