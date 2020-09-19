class PurchaseSerializer
  include FastJsonapi::ObjectSerializer
  attributes :user
  attributes :option do |obj|
    OptionSerializer.new(obj.option)
  end
  attributes :created_at, :updated_at
end
