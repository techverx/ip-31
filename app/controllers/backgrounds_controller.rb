class BackgroundsController < ApplicationController
before_filter :authenticate_user!

  def index
  @backgrounds = Background.order("name asc").paginate(:page => params[:page]).per_page(5)
      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @backgrounds  }
      end
  end

  def new
    @background = Background.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @background }
    end
    #3.times { @backgrounds.assets.build  }
  end

  def create
    @background = Background.new(params[:background])

    respond_to do |format|
      if @background.save
        flash[:success]='Background was successfully created.'
        format.html { redirect_to backgrounds_path }
        format.json { render json: @background, status: :created, location: @background }
      else
        format.html { render action: "new" }
        format.json { render json: @background.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @background = Background.find(params[:id])
    #3.times { @backgrounds.assets.build  }
  end

  def update

    @backgrounds = Background.find(params[:id])
    respond_to do |format|
      if @backgrounds.update_attributes(params[:background])
         flash[:success]="Background was successfully updated"
            format.html { redirect_to backgrounds_url }
      end

    end
  end

  def destroy
    @backgrounds = Background.find(params[:id])
    @backgrounds.destroy()
    respond_to do |format|
      format.html { redirect_to backgrounds_url }
    end
  end

  def show
    @background = Background.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @background  }
    end
  end

  def active_deactive
    @backgrounds = Background.find(params[:id])
    @backgrounds.active_yn = !@backgrounds.active_yn
    if @backgrounds.save
      if(@backgrounds.active_yn)
          flash[:success]="Background #{@backgrounds.name} is Active Now."
      else
          flash[:success]="Background #{@backgrounds.name} is Deactive Now."
      end
      #render :nothing => true
     redirect_to backgrounds_url
   # else
    #  render :status => 500, :nothing => true
    end
  end

  def download
    @backgrounds = Background.find(params[:id])
    options = { :filename => File.basename(@backgrounds.zip_file.path), :type => 'application/zip', :disposition => 'attachment' }
    #send_file @backgrounds.zip_file.path
   send_file(@backgrounds.zip_file.path,options)

  end

end
