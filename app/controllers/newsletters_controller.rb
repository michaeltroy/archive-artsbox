class NewslettersController < DashboardController
  
  before_filter       :user, :is_admin
# skip_before_filter  :is_active_user, :only => [:show, :new, :create]

  def user
    @user = User.find(params[:user_id])
  end
  
  # GET /newsletters 
  def index 
    @newsletters = @user.newsletters.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @newsletters }
    end  
  end
   
  # GET /newsletters/1 
  def show 
    @newsletter = Newsletter.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @newsletter }
    end  
  end 
  
  # GET /newsletters/new 
  def new 
    @newsletter = Newsletter.new

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @newsletter }
    end  
  end 
  
  # GET /newsletters/1;edit 
  def edit 
    @newsletter = Newsletter.find(params[:id]) 
  end 
  
  # POST /newsletters 
  def create 
    @newsletter = Newsletter.new(params[:newsletter])
    @newsletter = @active.newsletters.build(params[:newsletter]) 
    
    respond_to do |format|
      if @newsletter.save
        flash[:notice] = 'Newsletter was successfully created.'
        format.html { redirect_to user_newsletter_path(@user, @newsletter) }
        format.xml  { render :xml => @newsletter, :status => :created, :location => @newsletter }
      else
        format.html { render :action => :new }
        format.xml  { render :xml => @newsletter.errors, :status => :unprocessable_entity }
      end
    end
  end
   
  # PUT /newsletters/1 
  def update 
    @newsletter = Newsletter.find(params[:id]) 
    
    respond_to do |format|
      if @newsletter.update_attributes(params[:newsletter])
        flash[:notice] = 'Newsletter was successfully updated.'
        format.html { redirect_to user_newsletter_path(@user, @newsletter) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @newsletter.errors, :status => :unprocessable_entity }
      end
    end
  end
   
  # DELETE /newsletters/1 
   def destroy 
     @newsletter = @active.newsletters.find(params[:id])
     @newsletter.destroy

     respond_to do |format|
       format.html { redirect_to(user_newsletters_url) }
       format.xml  { head :ok }
     end
   end 
  
   # PUT /newsletters/1;send 
   def sendmail
     newsletter = Newsletter.find_by_id_and_sent(params[:id], false) || Newsletter.find(params[:id])
     users = User.find(:all) 
      users.each do |user|
        PostOffice.deliver_newsletter_mailout(user, newsletter) 
      end 
     newsletter.update_attribute('sent', true) 
     redirect_to user_newsletters_path 
   end
  
end
