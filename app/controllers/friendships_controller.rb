class FriendshipsController < DashboardController
  
  before_filter       :user
  before_filter       :is_active_user
  skip_before_filter  :is_admin
    
  def user
    @user = User.find_by_permalink(params[:permalink])
  end
  
  def create
    @friendship = active.friendships.build(:friend_id => params[:friend_id])
    if @friendship.save
      redirect_to :back
      flash[:notice] = "You have now added a new friend. User id= #{active.id}. Friend id=#{@user.id}"
    else
      redirect_to :back      
      flash[:error] = "Error occurred when adding friend."
    end
  end

  def destroy
    @friendship = active.friendships.find(params[:id])
    @friendship.destroy
    redirect_to :back
    flash[:notice] = "Successfully destroyed friendship."
  end
  
end