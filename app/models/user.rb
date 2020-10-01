class User < ApplicationRecord

   has_many :follower_follows, foreign_key: :followee_id, class_name: "Follow"
   has_many :followers, through: :follower_follows, source: :follower

   has_many :followee_follows, foreign_key: :followee_id, class_name: "Follow"
   has_many :followees, through: :followee_follows, source: :followee

   has_secure_password

   # validates_presence_of :email
   # validates_uniqueness_of :email

   def follow(name)
      user = User.find_by(name: name)
      Follow.create(follower_id: self.id, followee_id: user.id)
   end
end
