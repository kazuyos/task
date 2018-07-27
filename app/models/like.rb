class Like < ActiveRecord::Base
    validates :user_id , :task_id, {presence: true}
end
