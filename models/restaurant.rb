class Restaurant
  include Mongoid::Document
  field :_id
  field :active
  field :categories
  field :cover
  field :created_at
  field :foundation_date
  field :images_count
  field :name
  field :slogan
  field :store
  field :open
end