module::Api
  module::V1
    class Api::V1::PurchaseSerializer
      include FastJsonapi::ObjectSerializer
      attributes :user
      attributes :option do |obj|
        Api::V1::OptionSerializer.new(obj.option)
      end
      attributes :created_at, :updated_at
    end
  end
end
