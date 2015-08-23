# show all restaurants
get "/restaurant", provides: :json do
    content_type :json

    if restaurants = Restaurant.all
        status 200
        restaurants.to_a.to_json
    else
        json_status 404, "Not found"
    end
end


# add a new record
post "/restaurant", provides: :json do
    content_type :json

    restaurant = Restaurant.new
    data = JSON.parse(params[:restaurant])

    restaurant[:_id] = data["_id"]
    restaurant[:active] = data["active"]
    restaurant[:categories] = data["categories"]
    restaurant[:cover] = data["cover"]
    restaurant[:created_at] = data["created_at"]
    restaurant[:foundation_date] = data["foundation_date"]
    restaurant[:images_count] = data["images_count"]
    restaurant[:name] = data["name"]
    restaurant[:slogan] = data["slogan"]
    restaurant[:store] = data["store"]
    restaurant[:open] = data["open"]

    if restaurant.save
        status 200
        restaurant.to_json
    else
        json_status 400, restaurant.errors.to_hash
    end
end


# update
put "/restaurant", provides: :json do
    content_type :json

    data = JSON.parse(params[:restaurant])
    if restaurant = Restaurant.find(data["_id"])
        if restaurant.update_attributes(data)
            status 200
            restaurant.to_json
        else
            json_status 400, thing.errors.to_hash
        end
    else
        json_status 404, "Restaurant info not found"
    end
end


# delete
delete "/restaurant/:id", provides: :json do
    content_type :json

    if restaurant = Restaurant.find(params[:id])
        restaurant.destroy!
        status 200
    else
        json_status 404, "Restaurant info not found"
    end
end
