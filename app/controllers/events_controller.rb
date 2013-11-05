class EventsController < DashboardController
  
  before_filter       :box
  before_filter       :is_active_box, :except => [:index, :show]
  skip_before_filter  :is_admin
  
  def box
    @box = Box.find_by_permalink(params[:permalink])
  end
  
  # GET /events
  # GET /events.xml
  def index    
    @events = @box.events.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @events }
    end
  end

  # GET /events/1
  # GET /events/1.xml
  def show
    @event = Event.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @event }
    end
  end

  # GET /events/new
  # GET /events/new.xml
  def new
    @event = Event.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @event }
    end
  end

  # GET /events/1/edit
  def edit
    @event = Event.find(params[:id])
  end

  # POST /events
  # POST /events.xml
  def create
    @event = Event.new(params[:event])
    @event = @active.box.events.build(params[:event])

    respond_to do |format|
      if @event.save
        flash[:notice] = 'Event was successfully created.'
        format.html { redirect_to box_event_path(@box, @event) }
        format.xml  { render :xml => @event, :status => :created, :location => @event }
      else
        format.html { render :action => :new }
        format.xml  { render :xml => @event.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /events/1
  # PUT /events/1.xml
  def update
    @event = Event.find(params[:id])

    respond_to do |format|
      if @event.update_attributes(params[:event])
        flash[:notice] = 'Event was successfully updated.'
        format.html { redirect_to box_event_path(@box, @event) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @event.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.xml
  def destroy
    @event = @active.box.events.find(params[:id])
    @event.destroy
    flash[:notice] = 'Event was deleted.'    

    respond_to do |format|
      format.html { redirect_to box_events_path() }
      format.xml  { head :ok }
    end
  end
  
end
