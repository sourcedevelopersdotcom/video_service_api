module::Api
  module::V1
    class Api::V1::PurchasesController < ApplicationController
      # POST /purchases
      def create
        @purchase = Purchase.new(purchase_params)

        if @purchase.save
          render json: @purchase, status: :created
        else
          render json: @purchase.errors, status: :unprocessable_entity
        end
      end

      # Only allow a trusted parameter "white list" through.
      def purchase_params
        params.permit(:user_id, :option_id)
      end
    end
  end
end
