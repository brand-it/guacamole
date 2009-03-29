class ManasController < ApplicationController
  
  before_filter :admin, :only => [:new, :edit, :create, :destroy, :update]
  
  # GET /manas
  # GET /manas.xml
  #def index
  #  @manas = Mana.find(:all)

  #  respond_to do |format|
  #    format.html # index.html.erb
  #    format.xml  { render :xml => @manas }
  #  end
  #end

  # GET /manas/1
  # GET /manas/1.xml
  def show
    @mana = Mana.find(params[:id])

    respond_to do |format|
      format.html { render :mana }
      format.xml  { render :xml => @mana }
    end
  end

  # GET /manas/new
  # GET /manas/new.xml
  def new
    @mana = Mana.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @mana }
    end
  end

  # GET /manas/1/edit
  def edit
    @mana = Mana.find(params[:id])
  end

  # POST /manas
  # POST /manas.xml
  def create
    @mana = Mana.new(params[:mana])
    respond_to do |format|
      if @mana.save
        #render :update do |page|
        #  page.insert_html :top, "other", :partial => "show", :locals => { :mana => @mana }
        #end
        flash[:notice] = 'Mana was successfully created.'
        format.html { redirect_to card_path(@mana.card_id) }
      end
    end
  end

  # PUT /cards/1
  # PUT /cards/1.xml
  def update
    @mana = Mana.find(params[:id])

    respond_to do |format|
      if @mana.update_attributes(params[:mana])
        flash[:notice] = 'Mana was successfully updated.'
        format.html { redirect_to card_path(@mana.card_id) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @mana.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /manas/1
  # DELETE /manas/1.xml
  def destroy
    @mana = Mana.find(params[:id])
    @mana.destroy

    respond_to do |format|
      format.html { redirect_to card_path(@mana.card_id) }
      format.xml  { head :ok }
    end
  end
end
