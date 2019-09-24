class Client
  include Mongoid::Document
  field :company_name, type: String
  field :website, type: String
  field :email, type: String
  field :logo, type: String
  belongs_to :user
  has_many :product
end
