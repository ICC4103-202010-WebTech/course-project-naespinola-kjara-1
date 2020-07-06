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

      @users = User.where("name LIKE ? or username LIKE ? " ,
                          "%#{User.sanitize_sql_like(@parameter)}%",
                          "%#{User.sanitize_sql_like(@parameter)}%")

      @organizations = Organization.where("name LIKE ? ",
                                         "%#{Organization.sanitize_sql_like(@parameter)}%")

      @events = Event.where("title LIKE ? or description LIKE ?",
                            "%#{Event.sanitize_sql_like(@parameter)}%",
                            "%#{Event.sanitize_sql_like(@parameter)}%")

      @events_by_creator = Event.joins(:user).where("events.user_id=users.id and lower(users.username) and events.private=0 LIKE :search", search: "%#{@parameter}%")

      @events_by_org = Event.joins(:organization).where("events.organization_id= organizations.id and lower(organizations.name) LIKE :search", search: "%#{@parameter}%")


    end
  end
end
