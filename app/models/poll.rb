class Poll < ActiveRecord::Base
	has_many :options, dependent: :destroy
	has_many :rating_votes
  has_many :users, through: :rating_votes

	accepts_nested_attributes_for :options, :allow_destroy => true

  acts_as_taggable

  validates_presence_of :tag_list

	def total_poll_picks
		@picks = []
		self.options.each do |option|
			@picks << option.picks
		end
		
		@picks.sum 

	end

	def vote(direction, prev_vote = nil)
		if prev_vote.try(:up?)
			self.updownvote -= 1
      prev_vote.destroy
    elsif prev_vote.try(:down?)
    	self.updownvote += 1
    	prev_vote.destroy
    else
      direction == "up" ? self.updownvote += 1 : self.updownvote -= 1
		end
		
		save
	end
end
