class Poll < ActiveRecord::Base
	has_many :options, dependent: :destroy
	accepts_nested_attributes_for :options, :allow_destroy => true

	def total_poll_picks
		@picks = []
		self.options.each do |option|
			@picks << option.picks
		end
		@picks.sum
	end

end
