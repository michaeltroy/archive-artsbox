class FriendsController < DashboardController
  
  before_filter       :user
  skip_before_filter  :is_active_user, :only => [:index, :show]
  skip_before_filter  :is_admin
  
  def user
    @user = User.find(params[:user_id])
  end
  
  def index 
    @user = User.find(params[:user_id], :include => [:friendships => :friend]) 
  end 
 
  def show 
    redirect_to user_profile_path(params[:id]) 
  end
  
  def new 
    @user = User.find(@active) 
    @friend = User.find(params[:friend_id]) 
    unless @user.friends.include?(@friend) 
      @friendship = @user.friendships.new(:friend_id => @friend.id) 
    else 
      redirect_to friend_path(:user_id => @active, :id => @friend) 
    end 
  end 
 
  def edit 
    @user = User.find(@active) 
    @friendship = @user.friendships.find_by_friend_id(params[:id]) 
    @friend = @friendship.friend if @friendship 
    if !@friendship 
      redirect_to friend_path(:user_id => @active, :id => params[:id]) 
    end   
  end 
 
  def create 
      @user = User.find(@active) 
      params[:friendship][:friend_id] = params[:friend_id] 
      @friendship = @user.friendships.create(params[:friendship]) 
      redirect_to user_friends_path(:user_id => @active) 
    rescue ActiveRecord::RecordInvalid 
      render :action => 'new' 
  end 
 
  def update 
      @user = User.find(@active) 
      @friendship = @user.friendships.find_by_friend_id(params[:id]) 
      @friendship.update_attributes(params[:friendship]) 
      redirect_to friends_path(:user_id => @active) 
    rescue ActiveRecord::RecordInvalid 
      render :action => 'edit' 
  end
  
  def destroy 
    @user = User.find(params[:user_id]) 
    @friendship = @user.friendships.find_by_friend_id(params[:id]).destroy 
    redirect_to user_friends_path(:user_id => @active) 
  end 
  
end