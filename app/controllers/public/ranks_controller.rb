class Public::RanksController < ApplicationController
  
  def index
    @tags = Tag.all
  end

  def show
    @tag = Tag.find(params[:tag_id])
  end
  
end
