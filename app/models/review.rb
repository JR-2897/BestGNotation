class Review < ApplicationRecord
  belongs_to :user
  belongs_to :game
  after_create :update_user_status

  def update_user_status
    CheckUpdateStatusUserJob.perform_later(user)
  end
end
