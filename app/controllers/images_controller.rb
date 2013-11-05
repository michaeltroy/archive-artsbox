class ImagesController < DashboardController
  
  before_filter       :user
  skip_before_filter  :is_active_user, :only => [:index, :show]
  skip_before_filter  :is_admin
    
  def user
    @user = User.find_by_permalink(params[:permalink])
  end
  
  # GET /images
  # GET /images.xml
  def index
    @images = @user.images.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @images }
    end
  end

  # GET /images/1
  # GET /images/1.xml
  def show
    @image = @user.images.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @image }
    end
  end

  # GET /images/new
  # GET /images/new.xml
  def new
    @image = @user.images.build

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @image }
    end
  end

  # GET /images/1/edit
  def edit
    @image = @user.images.find(params[:id])
  end

  # POST /images
  # POST /images.xml
  def create
    @image = Image.new(params[:image])
    @image = @user.images.build(params[:image])

    respond_to do |format|
      if @image.save
        flash[:notice] = 'Image was successfully uploaded.'
        format.html { redirect_to user_images_path(@user) }
        format.xml  { render :xml => @image, :status => :created, :location => @image }
        format.js
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @image.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /images/1
  # PUT /images/1.xml
  def update
    @image = @user.images.find(params[:id])

    respond_to do |format|
      if @image.update_attributes(params[:image])
        flash[:notice] = 'Image was successfully updated.'
        format.html { redirect_to user_image_path(@user, @user)  }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @image.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /images/1
  # DELETE /images/1.xml
  def destroy
    @image = @user.images.find(params[:id])
    @image.destroy
    flash[:notice] = "Image has been removed."

    respond_to do |format|
      format.html { redirect_to user_images_path(@user) }
      format.xml  { head :ok }
    end
  end
end
