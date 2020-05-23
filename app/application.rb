class Application

  @@items = [Item.new("Water", 7.53),
            Item.new("Bread",9.32),
            Item.new("Egg",5.19)]


   def call(env)
       resp = Rack::Response.new
       req = Rack::Request.new(env)


      if req.path.match(/items/)
          item_name = req.path.split("/items/").last #turn /songs/Sorry into Sorry
          if item = @@items.find{|s| s.name == item_name}
            resp.write item.price
          else
            resp.status = 400
            resp.write "Item not found"
          end
      else
        resp.status=404
        resp.write "Route not found"
      end
        resp.finish
    end

end


#   def call(env)
#     resp = Rack::Response.new
#     req = Rack::Request.new(env)
#
#
#     if @@items.empty?
#       resp.write "Route not found"
#       resp.status = 404
#     elsif
#       item_to_add = req.params["item"]
#         if @@items.include? item_to_add
#           # @@items << item_to_add
#         resp.write "#{item_to_add.price}"
#     else
#         resp.write "Item not found"
#         resp.status = 400
#     end
#     else
#         resp.write "Route not found"
#         resp.status = 404
#     end
#       resp.finish
#   end
# end
