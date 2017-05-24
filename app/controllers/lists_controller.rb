class ListsController < ApplicationController
  def create
    @list = List.getList(current_user.id, params[:user_id])
    
   	@contact = User.find_by(id: params[:user_id])
 
    respond_to do |format|
      format.js
    end
  end
end
