class OptionsController < ApplicationController

  def pick
    @option = Option.find(params[:id])
    @option.picks += 1
    @option.save

    respond_to do |format|
	    format.js
	    format.html { render :nothing => true, :notice => 'Picked!' }
	  end
  end

 end