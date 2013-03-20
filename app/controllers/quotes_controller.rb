class QuotesController < ApplicationController
  include QuotesHelper
  before_filter :authenticate_user!
  # GET /quotes
  # GET /quotes.json
  def index
    @quotes = Quote.order("created_at asc").paginate(:page => params[:page]).per_page(5)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @quotes }
    end
  end

  # GET /quotes/1
  # GET /quotes/1.json
  def show
    @quote = Quote.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @quote }
    end
  end

  # GET /quotes/new
  # GET /quotes/new.json
  def new
    @quote = Quote.new
    @quote_categories=QuoteCategory.all
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @quote }
    end
  end

  # GET /quotes/1/edit
  def edit
    @quote = Quote.find(params[:id])
    @quote_categories=QuoteCategory.all
  end

  # POST /quotes
  # POST /quotes.json
  def create
    @quote = Quote.new(params[:quote])

    respond_to do |format|
      if @quote.save
        flash[:success]='Quote was successfully created.'
        format.html { redirect_to quotes_path}
        format.json { render json: @quote, status: :created, location: @quote }
      else
        format.html { render action: "new" }
        format.json { render json: @quote.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /quotes/1
  # PUT /quotes/1.json
  def update
    @quote = Quote.find(params[:id])
    respond_to do |format|
      if @quote.update_attributes(params[:quote])
        flash[:success]='Quote was successfully updated.'
        format.html { redirect_to quotes_path }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @quote.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /quotes/1
  # DELETE /quotes/1.json
  def destroy
    @quote = Quote.find(params[:id])
    @quote.destroy

    respond_to do |format|
      format.html { redirect_to quotes_url }
      format.json { head :no_content }
    end
  end

 def importquotes
  @quote_list = importquotess(QuoteCategory.find(params[:quote_category_list]).title,Quote.find(params[:quote_by_list]).quote_by)
 end

end
