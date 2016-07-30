FactoryGirl.define do

  factory :user do
    provider "google_oauth2"
    name "Lucy Fox"
    uid "112652673845890873859"
    oauth_token "12345"
    oauth_expires_at 2.days.from_now
  end
end
