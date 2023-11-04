class Public::TagsController < ApplicationController
  
  def index
    @tags = Tag.page(params[:page])
    @tags_all = Tag.all
  end
  
end
