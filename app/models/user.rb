class User < ApplicationRecord

  def self.find_or_create_from_auth_hash(auth)
    where(uid: auth.uid).first_or_initialize.tap do |user|
      user.uid = auth.uid
      user.first_name = auth.info.first_name
      user.last_name = auth.info.last_name
      user.email = auth.info.email
      user.picture = auth.info.image
      user.save!
    end
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def profile_photo(size)
    ActionController::Base.helpers.image_tag picture, alt: "#{full_name}'s profile photo", id: "propic", size: size
  end

end
