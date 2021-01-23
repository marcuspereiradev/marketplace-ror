class Product
  include Mongoid::Document

  field :name, type: String
  field :price, type: Float
  field :installments, type: Float
  field :number_of_installments, type: Integer
  field :image, type: String
  field :url, type: String

  belongs_to :client
  validates :name, uniqueness: true

  # searchkick
end
