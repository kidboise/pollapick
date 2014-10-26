class Option < ActiveRecord::Base
	belongs_to :poll


	def percentage
		@picks = []
		self.poll.options.each do |option|
			@picks << option.picks
		end

		@total_poll_picks = @picks.sum
		@percentage = ((self.picks.to_f) / (@total_poll_picks.to_f) * 100).round(1) 

		if @total_poll_picks == 0
			0
		else
			@percentage
		end
	end

end
