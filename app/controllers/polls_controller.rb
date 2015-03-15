class PollsController < ApplicationController
  before_action :set_poll, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: :index
  # GET /polls
  def index
    @polls = Poll.all.sort_by { |poll| poll.updownvote }.reverse
  end

  # GET /polls/1
  def show
    @poll = Poll.find(params[:id])
  end

  # GET /polls/new
  def new
    @poll = Poll.new
    4.times { @poll.options.build }
  end

  # GET /polls/1/edit
  def edit
  end

  # POST /polls
  def create
    @poll = Poll.new(poll_params)
    if params[:add_option]
      @poll.options.build
    else
      @poll.save
      flash[:notice] = "Poll is public!"
      redirect_to polls_path and return
    end
    render action: 'new'
  end

  # PATCH/PUT /polls/1
  def update
    if @poll.update(poll_params)
      redirect_to @poll, notice: 'Poll was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /polls/1
  def destroy
    @poll.destroy
    redirect_to polls_url, notice: 'Poll was successfully destroyed.'
  end

  def upvote
    @poll = Poll.find(params[:id])
    @poll.updownvote += 1
    @poll.save
    redirect_to polls_path

  end

  def downvote
    @poll = Poll.find(params[:id])
    @poll.updownvote -= 1
    @poll.save
    redirect_to polls_path

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_poll
      @poll = Poll.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def poll_params
      params.require(:poll).permit(:id, :question,
        options_attributes: [:id, :option_text, :percentage, :poll_id, :_destroy]
      )
    end
end
