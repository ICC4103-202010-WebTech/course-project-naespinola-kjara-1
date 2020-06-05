require 'securerandom'

include FactoryBot::Syntax::Methods
FactoryBot.define do
  factory :organization do
    name {FFaker::Company.name}
    image {FFaker::Image.image}
    rich_text {FFaker::Company.catch_phrase}
    description {Faker::ChuckNorris.fact}
    videos {FFaker::Movie.video(ext: 'mp4')}
    documents {FFaker::Filesystem.file_name(ext: 'doc')}
    pictures {FFaker::Image.image}
  end

  factory :user do
    organization
    username {Faker::Lorem.word}
    email { "#{name.gsub(/\s+/, "")}.#{lastname.gsub(/\s+/, "")}@example.com".downcase }
    password { SecureRandom.alphanumeric(8) }
    is_organization_admin {FFaker::Boolean.boolean}
    is_system_admin {FFaker::Boolean.boolean}
    in_blacklist {FFaker::Boolean.boolean}

    factory :user_with_events do
      transient do
        events_count {3}
      end
      after(:create) do |user, evaluator|
        create_list(:event, evaluator.events_count, user: user)
      end
    end

    factory :user_with_comments do
      transient do
        comments_count {5}
      end
      after(:create) do |user, evaluator|
        create_list(:comment, evaluator.comments_count, user: user)
      end
    end

    factory :user_with_reports do
      transient do
        reports_count {1}
      end
      after(:create) do |user, evaluator|
        create_list(:report, evaluator.reports_count, user: user)
      end
    end

    factory user_with_guests do
      transient do
        guests_count {5}
      end
      after(:create) do |user, evaluator|
        create_list(:guest, evaluator.guests_count, user: user)
      end
    end
    # pending received_messages and transmitted_messages
  end

  factory :location do
    country {Faker::Nation.nationality}
    region {Faker::WorldCup.city}

    factory location_with_profiles do
      transient do
        profiles_count {5}
      end
      after(:create) do |location, evaluator|
        create_list(:profile, evaluator.profiles_count, location: location)
      end
    end
  end

  factory :profile do
    user
    location
    image {FFaker::Image.image}
    document {FFaker::Filesystem.file_name(ext: 'doc')}
    videos {FFaker::Movie.video(ext: 'mp4')}
    short_bio { Faker::ChuckNorris.fact }
    name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
  end

  factory :message do
    user_receiver
    user_transmitter
    text_message {Faker::ChuckNorris.fact}
  end

  factory :event do
    user
    location
    title {Faker::Esport.event}
    description { Faker::ChuckNorris.fact }
    private {FFaker::Boolean.boolean}
    include_organization {FFaker::Boolean.boolean}
    image {FFaker::Image.image}
    documents {FFaker::Filesystem.file_name(ext: 'doc')}
    videos {FFaker::Movie.video(ext: 'mp4')}
    pictures {FFaker::Image.image}

    factory event_with_guests do
      transient do
        guests_count {20}
      end
      after(:create) do |event, evaluator|
        create_list(:guest, evaluator.guests_count, event: event)
      end
    end

    factory event_with_dates_to_votes do
      transient do
        dates_to_vote_count {3}
      end
      after(:create) do |event, evaluator|
        create_list(:dates_to_vote, evaluator.dates_to_vote_count, event: event)
      end
    end

    factory event_with_reports do
      transient do
        reports_count {1}
      end
      after(:create) do |event, evaluator|
        create_list(:report, evaluator.reports_count, event: event)
      end
    end

    factory event_with_comments do
      transient do
        comments_count {}
      end
      after(:create) do |event, evaluator|
        create_list(:comment, evaluator.comments_count, event: event)
      end
    end
  end

  factory :homepage do
    organization
    event
  end

  factory :guest do
    user
    event

    factory :guest_with_votes do
      transient do
        votes_count {5}
      end
      after(:create) do |guest, evaluator|
        create_list(:vote, evaluator.votes_count, guest: guest)
      end
    end
  end

  factory :dates_to_vote do
    event
    date { Faker::Date.between(from: Date.today, to: Date.today + 6.months) }

    factory :dates_to_vote_with_votes do
      transient do
        votes_count {15}
      end
      after(:create) do |dates_to_vote, evaluator|
        create_list(:vote, evaluator.votes_count, dates_to_vote: dates_to_vote)
      end
    end
  end

  factory :vote do
    guest
    dates_to_vote
  end

  factory :report do
    user
    event
  end

  factory :comment do
    user
    event
    rich_text {Faker::ChuckNorris.fact }

    #pending received_comments and transmitted_comments
  end

  factory :replies_to_comment do
    comment_receiver
    comment_transmitter
  end
end
