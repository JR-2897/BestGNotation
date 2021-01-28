class CheckUpdateStatusUserJob < ApplicationJob
  queue_as :default

  def perform(user)
    nb_reviews = Review.where(user: user)
    if nb_reviews >= 100
      user.update(status: "Maitre") 
    elsif nb_reviews >= 50
      user.update(status: "Expert")
    elsif nb_reviews >= 10
      user.update(status: "Intermédiare")
    else
      user.update(status: "Novice")
    end
  end
end
