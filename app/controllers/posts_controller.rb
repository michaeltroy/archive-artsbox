class PostsController < DashboardController
  
  before_filter       :user
  before_filter       :is_active_user, :except => [:index, :show]
  skip_before_filter  :is_admin 
  
  def user
    @user = User.find_by_permalink(params[:permalink])
  end
  
  # GET /posts
  # GET /posts.xml
  def index
    @posts = @user.posts.find(:all, :order => 'created_at DESC')
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml    { render :xml => @posts }
      format.json   { render :json => @posts }
      format.rss #index.rss.builder
    end
  end

  # GET /posts/1
  # GET /posts/1.xml
  def show
    @post = Post.find(params[:id])
    @comments = @post.comments.find(:all)
    @comment = Comment.new

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @post }
    end
  end

  # GET /posts/new
  # GET /posts/new.xml
  def new
    @post = Post.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @post }
    end
  end

  # GET /posts/1/edit
  def edit
    @post = Post.find(params[:id])
  end

  # POST /posts
  # POST /posts.xml
  def create
    @post = Post.new(params[:post])
    @post = @active.posts.build(params[:post])
    respond_to do |format|
      if @post.save
        flash[:notice] = 'Post was successfully created.'
        format.html { redirect_to user_post_path(@user, @post) }
        format.xml  { render :xml => @post, :status => :created, :location => @post }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @post.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /posts/1
  # PUT /posts/1.xml
  def update
    @post = Post.find(params[:id])

    respond_to do |format|
      if @post.update_attributes(params[:post])
        flash[:notice] = 'Post was successfully updated.'
        format.html { redirect_to user_post_path(@user, @post) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @post.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.xml
  def destroy
    @post = @active.posts.find(params[:id])
    @post.destroy
    flash[:notice] = 'Post was deleted.'

    respond_to do |format|
      format.html { redirect_to user_posts_path() }
      format.xml  { head :ok }
    end
  end
end
