namespace :db do
  task :populate_fake_data => :environment do
    puts "Populating database"
    create_list(:organization,10)
    create_list(:user_with_events,10)
    create_list(:user_with_comments,8)
    create_list(:user_with_reports,2)
    create_list(:user_with_guests,20)
    create_list(:location,30)
    create_list(:location_with_profiles,60)
    create_list(:event_with_guests,10)
    create_list(:event_with_dates_to_votes,20)
    create_list(:guest_with_votes,10)
  end
  task :queries_demo => :environment do

    puts("Query 1: Get all events created by certain user")
    result1 =  Event.joins(:user).where("events.user_id = 1").distinct.map {|x| x.title}
    puts(result1)
    puts("EOQ")

    puts("Query 2: Get all users belonging to an organization")
    result2 =  User.joins(:organization).where("users.organization_id = 1").map {|x| x.username}
    puts(result2)
    puts("EOQ")

    puts("Query 3: Get all public events in an organization")
    result3 =  Homepage.joins(:organization).where("homepages.organization_id = 1").map {|x| x.event.title}
    puts(result3)
    puts("EOQ")

    puts("Query 4: Get all private events in an organization")
    result4 =  Event.joins(user: :organization).where("users.organization_id = 1 and  events.private = true and events.include_organization = true").map{|x| x.title}
    puts(result4)
    puts("EOQ")

    puts("Query 5: Get all guests that have been invited to a certain event")
    result5 =  Guest.where("guests.event_id = 1").map{|x| x.user.username}
    puts(result5)
    puts("EOQ")

    puts("Query 6: Get all guests that have voted for a date option in a certain event")
    result6 =  Vote.joins(:dates_to_vote).where("dates_to_votes.event_id = 1").map {|x| x.guest.user.username}
    puts(result6)
    puts("EOQ")

    puts("Query 7: Get all comments written by users on a specific event")
    result7 = Comment.joins(:wall_of_comment).where("comments.wall_of_comment_id = 1 and wall_of_comments.event_id = 1").map {|x| x.rich_text}
    puts(result7)
    puts("EOQ")

    puts("Query 8: Get all comments written by a specific user on all events")
    result8 =  Comment.joins(:wall_of_comment).where("comments.user_id = 1").map{|x| x.rich_text}
    puts(result8)
    puts("EOQ")

    puts("Query 9: Get all users with administrative privileges in an organization")
    result9 =  User.joins(:organization).where("users.is_organization_admin = true").map{|x| x.username}
    puts(result9)
    puts("EOQ")

    puts("Query 10: Get all users with administrative privileges in the system")
    result10 =  User.where("users.is_system_admin = true").map{|x| x.username}
    puts(result10)
    puts("EOQ")

  end
end
