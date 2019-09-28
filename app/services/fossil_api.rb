require 'httparty'

class FossilApi
  include HTTParty
  base_uri 'https://www.fossil.com.br'

  def set_products_to_database
    @response = self.class.get("/api/catalog_system/pub/products/search?_from=0&_to=49")
    @products = JSON.parse(@response.body)

    @client = Client.find_by(company_name: 'Fossil')

    @all_products = @products.map {|product|
      Product.create!({
        client_id: @client.id,
        name: "#{product['productName']}",
        price: product['items'][0]['sellers'][0]['commertialOffer']['Price'],
        installments: "#{product['items'][0]['sellers'][0]['commertialOffer']['Installments']}",
        image: "#{product['items'][0]['images'][0]['imageUrl']}",
        url: "#{product['link']}",
      })
    }
  end
end

fossil_api = FossilApi.new
puts fossil_api.set_products_to_database
