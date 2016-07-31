FactoryGirl.define do

  factory :user do
    provider "google_oauth2"
    name "Lucy Fox"
    uid "112652673845890873859"
    oauth_token "12345"
    oauth_expires_at 2.days.from_now
  end

  factory :rated_brewery do
    api_id "LSKd"
    name
    image "www.example.com"
    postal_code "80202"
  end

  sequence :name do |n|
    "name-#{n}"
  end

  factory :rated_beer do
    api_id "alskd"
    name
    style_id "2"
    rated_brewery
  end

  factory :user_rated_beer do
    rating 1
    user
    rated_beer
  end
end
