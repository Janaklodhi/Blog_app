class Comment < ApplicationRecord
  belongs_to :article
end


# Customer
#   .select('customers.id, customers.last_name, reviews.body')
#   .joins(:reviews)
#   .where('reviews.created_at > ?', 1.week.ago)


#   # this is the sql query
# SELECT customers.id, customers.last_name, reviews.body
# FROM customers
# INNER JOIN reviews
#   ON reviews.customer_id = customers.id
# WHERE (reviews.created_at > '2019-01-08')
