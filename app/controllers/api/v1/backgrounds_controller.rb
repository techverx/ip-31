module Api
  module V1
    class BackgroundsController < ApplicationController
        respond_to :json,:xml

      def index
        respond_with Background.order("name asc")
      end

      def create
        respond_with Background.create(params[:background])
      end

      def show
        respond_with Background.find(params[:id])
      end

      def update
        respond_with Background.update(params[:id],params[:background])
      end

      def destroy
       respond_with Background.destroy(params[:id])
      end

      def get_image_urls
        File.basename(Background.find(params[:id]).image.path)
      end

    end
  end
end