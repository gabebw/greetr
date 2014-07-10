class User < ActiveRecord::Base
  validates :username, presence: true, uniqueness: true

  has_many :greetings, foreign_key: :sender_id

  def self.except(user)
    where.not(id: user.id)
  end

  def identifier
    username
  end

  def pusher_channel_name
    "private-greetings-#{id}"
  end
end
