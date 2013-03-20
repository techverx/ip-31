module Api
  module V1
    class FontsController < ApplicationController
        respond_to :json,:xml

      def index
        respond_with Font.order("name asc")
      end

      def create
        respond_with Font.create(params[:font])
      end

      def show
        respond_with Font.find(params[:id])
      end

        def update
          respond_with Font.update(params[:id],params[:font])
        end

        def destroy
         respond_with Font.destroy(params[:id])
        end

    end
  end
end