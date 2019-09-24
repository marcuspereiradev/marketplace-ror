class Product
  include Mongoid::Document
  field :name, type: String
  field :price, type: Float
  field :installments, type: Float
  field :image, type: String
  field :url, type: String
  belongs_to :client
end
