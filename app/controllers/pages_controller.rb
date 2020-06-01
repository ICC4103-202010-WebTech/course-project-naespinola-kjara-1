class PagesController < ApplicationController
  def home
    @events = Event.where("events.private = 0")
    @organizations = Organization.all

  end

end
