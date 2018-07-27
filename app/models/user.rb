class User < ActiveRecord::Base
    has_secure_password
    
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :password, presence: true
    validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }

    def tasks
        return Task.where(user_id: self.id)
    end
end
