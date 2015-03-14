class Option < ActiveRecord::Base
	belongs_to :poll

	has_many :votes
  has_many :users, through: :votes

	def percentage
		@picks = []
		self.poll.options.each do |option|
			@picks << option.picks
		end

		@total_poll_picks = @picks.sum

		if @total_poll_picks == 0
			@percentage = 0
		else
			@percentage = ((self.picks.to_f) / (@total_poll_picks.to_f) * 100).round
		end
	
		@percentage
	end

	def pick_by user
		users_vote = votes.find_by(user_id: user.id)

		unless users_vote
			check_votes user.id

			self.picks += 1
			save

			votes.create(user_id: user.id)
		else
			self.picks -= 1
			save

			users_vote.destroy
		end

	end

	def check_votes user_id
		vote = poll.options.joins(:votes).map{ |option| option.votes.find_by(user_id: user_id) }
		
		if vote.any?
			prev_option = vote.first.option
			prev_option.picks -= 1
			prev_option.save

			vote.first.destroy 
		end
	end
end
