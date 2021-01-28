require 'httparty'

class ProductImporter
  def self.import_products_from_client(client, page=1, from=0, to=49)
    return unless client.website.present?

    if page > 1
      from += 50
      to += 50
    end

    response = HTTParty.get("#{client.website}/api/catalog_system/pub/products/search?_from=#{from}&_to=#{to}")
    products = JSON.parse(response.body)

    return unless products.present? && products.length > 0

    products.each do |product|
      next unless product['items'][0]['sellers'][0]['commertialOffer']['Installments'].present?
      Product.create({
        client_id: client.id,
        name: product['productName'],
        price: product['items'][0]['sellers'][0]['commertialOffer']['Price'],
        installments: product['items'][0]['sellers'][0]['commertialOffer']['Installments'].max_by{|item| item['NumberOfInstallments']}['Value'],
        number_of_installments: product['items'][0]['sellers'][0]['commertialOffer']['Installments'].max_by{|item| item['NumberOfInstallments']}['NumberOfInstallments'],
        image: product['items'][0]['images'][0]['imageUrl'],
        url: product['link'],
        gender: product['Gênero']
      })
    end

    unless Product.count >= 100
      self.import_products_from_client(client, page+1, from, to)
    end
  end
end
