class Repository < ActiveRecord::Base
    def self.create_from_username(username)
      content = HTTParty.get(
          "https://api.github.com/users/#{username}/repositories",
          :headers => {"Authorization" => "token #{ENV['GITHUB_TOKEN']}",
                       "User-Agent" => "anyone"
                      }
      )
      name = content["name"]
      url = content["url"]
      forks = content["forks_count"]
      stars = content["stargazers_count"]
      git_updated = content["updated_at"]
      language = content["language"]

      if content["name"]
        Profile.create(body: content, name: username, avatar_url: avatar_url, location: location, company_name: company_name, followers: followers, following: following)
      else
        return nil
      end
    end



  def name
    @content["name"]
  end

  def url
    @content["url"]
  end

  def number_of_forks
    @content["forks_count"].to_i
  end

  def number_of_stars
    @content["stargazers_count"].to_i
  end

  def updated_at
    @content["updated_at"].to_datetime
  end

  def language
    @content["language"]
  end
end
