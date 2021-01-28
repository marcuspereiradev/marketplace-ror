class Product
  include Mongoid::Document

  field :name, type: String
  field :price, type: Float
  field :installments, type: Float
  field :number_of_installments, type: Integer
  field :image, type: String
  field :url, type: String
  field :gender, type: Array

  belongs_to :client
  validates :name, uniqueness: true

  # searchkick

  scope :biggest_price, lambda { order(price: :desc) }
  scope :lowest_price, lambda { order(price: :asc) }
  scope :gender_unissex, lambda { where(gender: ["Feminino", "Masculino"]) }
  scope :gender_male, lambda { where(gender: ["Masculino"]) }
  scope :gender_female, lambda { where(gender: ["Feminino"]) }
end
