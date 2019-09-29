class Client
  include Mongoid::Document

  field :company_name, type: String
  field :website, type: String
  field :email, type: String
  field :logo, type: String

  belongs_to :user
  has_many :products

  after_save :import_products

  def import_products
    ProductImporter.import_products_from_client(self)
  end
end
