class PagesController < ApplicationController
  def home
    @events = Event.where("events.private = false")
  end

end
