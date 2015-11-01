class ItemsController < ApplicationController
  def index

  	if params[:keywords]
  		@items = Item.where('name LIKE ?', "%#{params[:keywords]}%")
  	else 
  		[]
  	end 
  end
end
