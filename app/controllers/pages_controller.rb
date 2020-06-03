class PagesController < ApplicationController
  def home
    @events = Event.where("events.private = 0")
    @organizations = Organization.all

  end

  def search
    if params[:search].blank?
      redirect_to(root_path, alert: "Empty field!") and return
    else
      @parameter = params[:search].downcase

      @results_username = User.all.where("lower(username) LIKE :search", search: "%#{@parameter}%")

      @results_name = Profile.all.where("lower(name) LIKE :search", search: "%#{@parameter}%")

      @results_organization = Organization.all.where("lower(name) LIKE :search", search: "%#{@parameter}%")

      @results_event = Event.all.where("lower(title) or lower(description) LIKE :search", search: "%#{@parameter}%")

      @results_event_org = Event.joins(user: :organization).where("events.include_organization=1 and users.organization_id=organizations.id and lower(organizations.name) LIKE :search", search: "%#{@parameter}%")

      @results_event_creator = Event.joins(:user).where("events.user_id=users.id and lower(users.username) LIKE :search", search: "%#{@parameter}%")
    end
  end

end
