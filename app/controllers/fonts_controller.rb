class FontsController < ApplicationController
before_filter :authenticate_user! 
  # GET /fonts
  # GET /fonts.json
  def index
    @fonts = Font.order("name asc").paginate(:page => params[:page]).per_page(5)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @fonts }
    end
  end

  # GET /fonts/1
  # GET /fonts/1.json
  def show
    @font = Font.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @font }
    end
  end

  # GET /fonts/new
  # GET /fonts/new.json
  def new
    @font = Font.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @font }
    end
  end

  # GET /fonts/1/edit
  def edit
    @font = Font.find(params[:id])
  end

  # POST /fonts
  # POST /fonts.json
  def create
    @font = Font.new(params[:font])

    respond_to do |format|
      if @font.save
        flash[:success] = 'Font was successfully created.'
        format.html { redirect_to fonts_path }
        format.json { render json: @font, status: :created, location: @font }
      else
        format.html { render action: "new" }
        format.json { render json: @font.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /fonts/1
  # PUT /fonts/1.json
  def update
    @font = Font.find(params[:id])

    respond_to do |format|
      if @font.update_attributes(params[:font])
        flash[:success] = 'Font was successfully updated.'
        format.html { redirect_to fonts_path}
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @font.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fonts/1
  # DELETE /fonts/1.json
  def destroy
    @font = Font.find(params[:id])
    @font.destroy

    respond_to do |format|
      format.html { redirect_to fonts_url }
      format.json { head :no_content }
    end
  end
  
  def active_deactive
    @fonts = Font.find(params[:id])
    @fonts.active_yn = !@fonts.active_yn
    if @fonts.save
      if(@fonts.active_yn)
          flash[:success]="Font is Active Now."
      else
          flash[:success]="Font is Deactive Now."
      end
      redirect_to fonts_url
    end
  end
  
end
