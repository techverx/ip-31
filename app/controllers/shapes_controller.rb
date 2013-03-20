class ShapesController < ApplicationController

  before_filter :authenticate_user!
  # GET /shapes
  # GET /shapes.json
  def index
    @shapes = Shape.order("name asc").paginate(:page => params[:page]).per_page(5)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @shapes }
    end
  end

  # GET /shapes/1
  # GET /shapes/1.json
  def show
    @shape = Shape.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @shape }
    end
  end

  # GET /shapes/new
  # GET /shapes/new.json
  def new
    @shape = Shape.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @shape }
    end
  end

  # GET /shapes/1/edit
  def edit
    @shape = Shape.find(params[:id])
  end

  # POST /shapes
  # POST /shapes.json
  def create
    @shape = Shape.new(params[:shape])

    respond_to do |format|
      if @shape.save
        flash[:success]='Shape was successfully created.'
        format.html { redirect_to shapes_path }
        format.json { render json: @shape, status: :created, location: @shape }
      else
        format.html { render action: "new" }
        format.json { render json: @shape.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /shapes/1
  # PUT /shapes/1.json
  def update
    @shape = Shape.find(params[:id])

    respond_to do |format|
      if @shape.update_attributes(params[:shape])
        format.html { redirect_to shapes_path, notice: 'Shape was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @shape.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shapes/1
  # DELETE /shapes/1.json
  def destroy
    @shape = Shape.find(params[:id])
    @shape.destroy

    respond_to do |format|
      format.html { redirect_to shapes_url }
      format.json { head :no_content }
    end
  end

  def active_deactive
    @shape = Shape.find(params[:id])
    @shape.active_yn = !@shape.active_yn
    if @shape.save
      if(@shape.active_yn)
        flash[:success]="Shape is Active Now."
      else
        flash[:success]="Shape is Deactive Now."
      end
      redirect_to shapes_url
    end
  end
end
