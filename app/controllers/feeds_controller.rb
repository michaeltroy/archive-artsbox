class FeedsController < DashboardController
  
  before_filter       :user
  skip_before_filter  :is_admin
  
  def user
    @user = User.find_by_permalink(params[:permalink])
  end
  
  def index
    @friends = active.friends
    new_images = Image.find(:all, :conditions => {:user_id => @friends}, :limit => 4, :order => 'created_at DESC')
    new_posts = Post.find(:all, :conditions => {:user_id => @friends}, :limit => 4, :order => 'created_at DESC')
    new_comments = Comment.find(:all, :conditions => {:user_id => @friends}, :limit => 4, :order => 'created_at DESC')
    @activity = (new_images + new_posts + new_comments).sort_by(&:created_at).reverse
  end
  
end