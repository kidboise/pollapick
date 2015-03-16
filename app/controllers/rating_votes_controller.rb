class RatingVotesController < ApplicationController
  before_action :check_user

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

  private
  def check_user
    render(js: "window.location = #{new_user_session_path.to_json}") unless current_user
  end
end
