class HomeController < ApplicationController
  def index
  	   session[:conversations] ||= []
 
    @users = User.all.where.not(id: current_user) #.where(["updated_at > ?", 10.minutes.ago])
    #@conversationbl = Conversation.where(sender_id:  current_user.id).or(Conversation.where(recipient_id: current_user.id)) 
    # @conversations =  @conversationbl.includes(:recipient, :messages) 
    #@conversationsWithoutId = Conversation.all.where.not(["toggled_users LIKE ?", current_user.id])
    #@conv = @conversationsWithoutId.toggled_users.include?(current_user.id.to_i)
   @conversations = Conversation.includes(:recipient, :messages).find(session[:conversations])
    @list = List.where(user_id: current_user.id).or(List.where(contact_id: current_user.id))
  	respond_to do |format|
  format.html
  format.json  { render :json => {:conversations => @conversations, 
                                  :users => @users }}
end
  end

def search
  render  json: User.terms_for(params[:term])
  end



end
