class User < ActiveRecord::Base
  def self.find_or_create_by_auth(auth_data)
    user = self.find_or_create_by_uid(auth_data["uid"])
    if user.name != auth_data["user_info"]["name"]
      user.name = auth_data["user_info"]["name"]
      user.save
    end
    return user
  end
end
