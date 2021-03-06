class Greeting < ActiveRecord::Base
  belongs_to :receiver, class_name: "User"
  belongs_to :sender, class_name: "User"

  validates :body, presence: true

  def self.addressed_to(user)
    where(receiver: user)
  end

  def self.newest_first
    order("created_at DESC")
  end

  def self.for_homepage_of(user)
    addressed_to(user).newest_first.includes(:sender)
  end
end
