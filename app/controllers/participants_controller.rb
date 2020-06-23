class ParticipantsController < ApplicationController
  def participants
    @members = Member.joins(:organization).where("members.user_id = #{params[:id]}")


  end
end
