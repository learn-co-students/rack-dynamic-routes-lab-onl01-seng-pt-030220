class Application
  
  @@items = [ ]

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)
  
    if req.path.match(/items/)
      name = req.path.split("/").last
      if item = @@items.find{ |i| i.name == name }
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