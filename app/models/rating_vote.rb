class RatingVote < ActiveRecord::Base
  belongs_to :user
  belongs_to :poll

  def up?
    direction == "up"
  end

  def down?
    direction == "down"
  end
end
