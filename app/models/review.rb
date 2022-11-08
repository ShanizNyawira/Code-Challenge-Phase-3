class Review < ActiveRecord::Base
    belongs_to :product
    belongs_to :user
    def user
      User.find(self.user_id)
    end
  
    def print_review
        puts "Review for #{self.product.name} by #{self.user.name}: #{self.start_rating}. #{self.comment}"
    end
  
  end