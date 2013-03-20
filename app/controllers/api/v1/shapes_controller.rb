module Api
  module V1
    class ShapesController < ApplicationController
      respond_to :json,:xml

      def index
        respond_with Shape.order("name asc")
      end

      def create
        respond_with Shape.create(params[:Shape])
      end

      def show
        respond_with Shape.find(params[:id])
      end

      def update
        respond_with Shape.update(params[:id],params[:Shape])
      end

      def destroy
        respond_with Shape.destroy(params[:id])
      end

      def get_image_urls
        File.basename(Shape.find(params[:id]).image.path)
      end

    end
  end
end