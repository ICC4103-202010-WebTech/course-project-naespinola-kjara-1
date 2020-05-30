class PagesController < ApplicationController
  def home
    @events = Event.where("events.private = 0")
    @organizations = Organization.all
    puts "Hola mundooooooooo"
    puts current_user.email
  end

end
