class Restaurant < ActiveRecord::Base
  validates :name,    presence: true
  validates :tel,     presence: true
  validates :address, presence: true


  has_many :reviews
  has_many :users, through: :reviews

  def average_satisfaction(restaurant_id)
    if Review.where(restaurant_id: restaurant_id).count > 0
      Review.where(restaurant_id: restaurant_id).average(:satisfaction)
    else
      return 0
    end
  end

  def average_satisfaction_star(restaurant_id)
  if Review.where(restaurant_id: restaurant_id).count > 0
    if Review.where(restaurant_id: restaurant_id).average(:satisfaction) == 5
        return "★★★★★"
      elsif Review.where(restaurant_id: restaurant_id).average(:satisfaction) >= 4
        return "★★★★☆"
      elsif Review.where(restaurant_id: restaurant_id).average(:satisfaction) >= 3
        return "★★★☆☆"
      elsif Review.where(restaurant_id: restaurant_id).average(:satisfaction) >= 2
        return "★★☆☆☆"
      else Review.where(restaurant_id: restaurant_id).average(:satisfaction) >= 1
        return "★☆☆☆☆"
      end
    else
      return "☆☆☆☆☆"
    end
  end

end
