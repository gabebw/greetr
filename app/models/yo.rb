class Yo < ActiveRecord::Base
  belongs_to :receiver, class_name: "User"
  belongs_to :sender, class_name: "User"

  def self.addressed_to(user)
    where(receiver: user)
  end

  def self.newest_first
    order("created_at DESC")
  end
end
