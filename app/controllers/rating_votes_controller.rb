class RatingVotesController < ApplicationController
  def create
    @poll = Poll.find(params[:poll_id])
    vote = @poll.rating_votes.find_by(user_id: current_user.id)

    if vote
      @poll.vote(params[:direction], vote)
    else
      RatingVote.create(poll_id: params[:poll_id], user_id: current_user.id, direction: params[:direction])
      @poll.vote(params[:direction])
    end    
  end
end
