module::Api
  module::V1
    class Api::V1::LibrariesController < ApplicationController
      # GET /libraries
      def index
        @libraries = Library.where_user(params[:user_id]).order_by_remaining_time
        @user = User.find(params[:user_id])

        json = Rails.cache.fetch(Purchase.cache_key(@user)) do
          Api::V1::PurchaseSerializer.new(@libraries).serializable_hash.to_json
        end

        render json: json
      end
    end
  end
end
