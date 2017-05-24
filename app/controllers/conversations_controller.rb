class ConversationsController < ApplicationController

  def create
    @conversation = Conversation.get(current_user.id, params[:user_id])
    
    add_to_conversations unless conversated?
 
    respond_to do |format|
      format.js
    end
  end


  def close
    @conversation = Conversation.find(params[:id])
 
    session[:conversations].delete(@conversation.id)
 
    respond_to do |format|
      format.js
    end
  end

  def toggleDownscale
     @conversation = Conversation.find(params[:id])
     @conversation.toggled_users.push(current_user.id)
     @conversation.save
     respond_to do |format|
      format.js
    end
  end
    def toggleUpscale
     @conversation = Conversation.find(params[:id])
     @conversation.toggled_users.delete(current_user.id)
     @conversation.save
     respond_to do |format|
      format.js
    end
  end
 
  private
 
  def add_to_conversations
    session[:conversations] ||= []
    session[:conversations] << @conversation.id
  end
 
  def conversated?
    session[:conversations].include?(@conversation.id)
  end
end
