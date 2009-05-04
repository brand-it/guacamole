class CardsController < ApplicationController
  
  before_filter :admin, :only => [:new, :edit, :create, :destroy, :update]
  protect_from_forgery :except => [:auto_complete_for_card_search] 
  # GET /cards
  # GET /cards.xml
  def index
    @cards = Card.find(:all, :order => :name)
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @cards }
    end
  end
  
  def search
    @cards = Card.search params[:card][:search]
    respond_to do |format|
      format.html { render :index }
      format.xml  { render :xml => @cards }
    end
  end
  
  def auto_complete_for_card_search
    @cards = Card.find(:all, :conditions => ["name LIKE ?", "%" + params[:search] + "%"], :order => :name)
  end

  # GET /cards/1
  # GET /cards/1.xml
  def show
    @card = Card.find(params[:id], :include => [:image, :manas] )

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @card }
    end
  end

  # GET /cards/new
  # GET /cards/new.xml
  def new
    @card = Card.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @card }
    end
  end

  # GET /cards/1/edit
  def edit
    @card = Card.find(params[:id])
  end

  # POST /cards
  # POST /cards.xml
  def create
    @card = Card.new(params[:card])

    respond_to do |format|
      if @card.save
        flash[:notice] = 'Cards was successfully created.'
        format.html { redirect_to(@card) }
        format.xml  { render :xml => @card, :status => :created, :location => @card }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @card.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /cards/1
  # PUT /cards/1.xml
  def update
    @card = Card.find(params[:id])

    respond_to do |format|
      if @card.update_attributes(params[:card])
        flash[:notice] = 'Cards was successfully updated.'
        format.html { redirect_to(@card) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @card.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /cards/1
  # DELETE /cards/1.xml
  def destroy
    @card = Card.find(params[:id])
    @card.destroy

    respond_to do |format|
      format.html { redirect_to(cards_url) }
      format.xml  { head :ok }
    end
  end
end
