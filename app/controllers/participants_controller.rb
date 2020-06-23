class ParticipantsController < ApplicationController
  def participants
    @user = User.where("id= #{params[:id]}")
  end
end
