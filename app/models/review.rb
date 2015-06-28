class Review < ActiveRecord::Base
  validates :body,         presence: true
  validates :satisfaction, presence: true

  belongs_to :user
  belongs_to :restaurant

  def satisfaction_star(score)
    if score == 5
      return "★★★★★"
    elsif score >= 4
      return "★★★★☆"
    elsif score >= 3
      return "★★★☆☆"
    elsif score >= 2
      return "★★☆☆☆"
    elsif score >= 1
      return "★☆☆☆☆"
    else
      return "☆☆☆☆☆"
    end
  end
end
