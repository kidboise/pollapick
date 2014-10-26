class OptionsController < ApplicationController

  def pick
    @option = Option.find(params[:id])
    @option.picks += 1
    @option.save
    redirect_to polls_path
  end

 end