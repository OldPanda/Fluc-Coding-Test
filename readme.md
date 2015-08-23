Fluc Code Test
===

Maybe this little program doesn't look perfect since I'm new to Ruby and this is actually my first Ruby code. The endpoints I implemented are

* Query all the restaurants
* Update one restaurant
* Delete a restaurant

How to Run It
---
At project directory, execute

```
rackup
```

Usage
---
* Query all the restaurants   
```
curl http://<address>:<port>/restaurant
```
* Update one restaurant   
```
curl -X PUT http://<address>:<port>/restaurant --data 'restaurant=<JSON DATA>'
```
* Delete a restaurant   
```
curl -X DELETE http://<address>:<port>/restaurant/<record id>
```

I also implemented an extra add function which could be called by POST request

```
curl http://<address>:<port>/restaurant --data 'restaurant=<JSON DATA>'
```