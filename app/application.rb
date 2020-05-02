class Application

  @@items = [Item.new("iphone", 1250.34), Item.new("macbook", 3499.99)]

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match("/items/")
      item_name = req.path.split("/items/").last
        if item = @@items.find {|i| i.name == item_name}
          resp.write item.price
        else
          resp.write "Item not found"
          resp.status = 400
        end
    else
      resp.write "Route not found"
      resp.status = 404
    end
    resp.finish
  end

end