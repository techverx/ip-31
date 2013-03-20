class QuoteCategoriesController < ApplicationController
  before_filter :authenticate_user!
  # GET /quote_categories
  # GET /quote_categories.json
  def index
    @quote_categories = QuoteCategory.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @quote_categories }
    end
  end

  # GET /quote_categories/1
  # GET /quote_categories/1.json
  def show
    @quote_category = QuoteCategory.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @quote_category }
    end
  end

  # GET /quote_categories/new
  # GET /quote_categories/new.json
  def new
    @quote_category = QuoteCategory.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @quote_category }
    end
  end

  # GET /quote_categories/1/edit
  def edit
    @quote_category = QuoteCategory.find(params[:id])
  end

  # POST /quote_categories
  # POST /quote_categories.json
  def create
    @quote_category = QuoteCategory.new(params[:quote_category])

    respond_to do |format|
      if @quote_category.save
        format.html { redirect_to @quote_category, notice: 'Quote category was successfully created.' }
        format.json { render json: @quote_category, status: :created, location: @quote_category }
      else
        format.html { render action: "new" }
        format.json { render json: @quote_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /quote_categories/1
  # PUT /quote_categories/1.json
  def update
    @quote_category = QuoteCategory.find(params[:id])

    respond_to do |format|
      if @quote_category.update_attributes(params[:quote_category])
        format.html { redirect_to @quote_category, notice: 'Quote category was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @quote_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /quote_categories/1
  # DELETE /quote_categories/1.json
  def destroy
    @quote_category = QuoteCategory.find(params[:id])
    @quote_category.destroy

    respond_to do |format|
      format.html { redirect_to quote_categories_url }
      format.json { head :no_content }
    end
  end
end
