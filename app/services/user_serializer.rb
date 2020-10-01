class UserSerializer
   def initialize(user_object)
      @user = user_object
   end

   def to_serialized_json
      options = {
         include: {
            follower_follows: {
               include: {
                  follower: {
                     only: [:email]
                  }
               }
            }
         },
         followee_follows: {
            include: {
               followee: {
                  only: [:email]
               }
            }
         }
      }
      @user.to_json(options)
   end
end