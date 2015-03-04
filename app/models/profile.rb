class Profile < ActiveRecord::Base
  has_many :repositories
  validates :name, uniqueness: true

  def self.create_from_username(username)
    content = HTTParty.get(
        "https://api.github.com/users/#{username}",
        :headers => {"Authorization" => "token #{ENV['GITHUB_TOKEN']}",
                     "User-Agent" => "anyone"
                    }
    )
    username = content["login"]
    avatar_url = content["avatar_url"]
    location = content["location"]
    company_name = content["company"]
    followers = content["followers"]
    following = content["following"]

    if content["login"]
      Profile.create(body: content, name: username, avatar_url: avatar_url, location: location, company_name: company_name, followers: followers, following: following)
    else
      return nil
    end
  end



end
