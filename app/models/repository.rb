class Repository < ActiveRecord::Base
  belongs_to :profile
  validates :name, uniqueness: true
  def self.create_from_username(username)
    content = HTTParty.get(
        "https://api.github.com/users/#{username}/repos",
        :headers => {"Authorization" => "token #{ENV['GITHUB_TOKEN']}",
                     "User-Agent" => "anyone"
                    }
    )
    content.each do |c|
      name = c["name"]
      url = c["url"]
      forks = c["forks_count"]
      stars = c["stargazers_count"]
      git_updated = c["updated_at"]
      language = c["language"]
      profile_id = Profile.find_by(name: "#{username}").id
      if c["name"]
        Repository.create(name: name, url: url, forks: forks, stars: stars, git_updated: git_updated, language: language, profile_id: profile_id)
      else
        return nil
      end
    end
    Repository.all
  end

  def self.update_from_username(username)
  end

end
