class Product < ActiveRecord::Base
    has_many :reviews
    has_many :users, through: :reviews
  
    def leave_review(user, start_rating, comment)
        Review.create(start_rating: start_rating, comment: comment, user_id: user.id, product_id: self.id)
    end
  
    def print_all_reviews
        self.reviews.map do |review|
            puts "Review for #{self.name} by #{review.user.name}: #{review.start_rating}. #{review.comment}"
        end
    end
  
    def average_rating
      self.reviews.average(:star_rating).to_f
    end   
end