class OptionsController < ApplicationController
  
  def pick
    @option = Option.find(params[:id])
    current_user ? @option.pick_by(current_user) : render(js: "window.location = #{new_user_session_path.to_json}")
  end
 end