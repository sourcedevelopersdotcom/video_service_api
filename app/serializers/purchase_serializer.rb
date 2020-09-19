class PurchaseSerializer
  include FastJsonapi::ObjectSerializer
  attributes :user, :option
end
