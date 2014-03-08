ActiveAdmin.register Article do
  permit_params :supplier_id, :name, :order_number, :description, :manufacturer, :origin, :url, :image,
    :article_category_id, price_attributes: [:unit, :unit_quantity, :price, :deposit, :tax]

 
  filter :supplier, as: :select
  #filter :article_category, :select
  filter :name
  filter :order_number
  filter :price_price, as: :numeric, label: 'net price'
  filter :manufacturer
  filter :origin
  filter :url, as: :boolean
  filter :image, as: :boolean

  form do |f|
    f.inputs 'General' do
      f.input :supplier
      f.input :name
      f.input :order_number
      f.input :description, input_html: { rows: 3 }
    end
    f.inputs 'Price', for: [:price, f.object.price || ArticlePrice.new] do |p|
      p.input :unit_quantity
      p.input :unit
      p.input :price
      p.input :tax
      p.input :deposit
    end
    f.inputs 'Details' do
      f.input :article_category
      f.input :manufacturer
      f.input :origin
      f.input :url
    end
    f.actions
  end
 
end
