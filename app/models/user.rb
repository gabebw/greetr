class User < ActiveRecord::Base
  validates :username, presence: true, uniqueness: true
  validates :password_digest, presence: true

  has_many :greetings, foreign_key: :sender_id, dependent: :destroy

  def self.except(user)
    where.not(id: user.id)
  end

  def self.pusher_channel_prefix
    "private-greetings-"
  end

  def identifier
    username
  end

  def pusher_channel_name
    "#{self.class.pusher_channel_prefix}#{id}"
  end

  def most_recent_correspondent
    greetings.newest_first.first.receiver
  end
end
