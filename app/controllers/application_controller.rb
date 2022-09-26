class ApplicationController < Sinatra::Base
 set :default_content_type, 'application/json'
    get '/' do
      "Hello World"
    end

    get '/bakeries' do 
      bakeries = Bakery.all
      # send them back as a JSON array
      bakeries.to_json
    end

    get "/bakeries/:id" do
    bakeries=Bakery.find(params[:id])
    bakeries.to_json(include: :baked_goods)
    end

    get "/baked_goods/by_price" do
    baked_goods = BakedGood.order('price DESC')
    baked_goods.to_json
    end

    get "/baked_goods/most_expensive" do
      expensive_item = BakedGood.order('price DESC').first
      expensive_item.to_json
    end

  end
