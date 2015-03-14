class OptionsController < ApplicationController

  def pick
    @option = Option.find(params[:id])
    @option.pick_by current_user

    respond_to do |format|
	    format.js
	    format.html { render :nothing => true, :notice => 'Picked!' }
	  end
  end

 end