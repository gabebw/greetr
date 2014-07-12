class User < ActiveRecord::Base
  validates :username, presence: true, uniqueness: true
  validates :password_digest, presence: true

  has_many :greetings, foreign_key: :sender_id, dependent: :destroy

  def self.except(user)
    where.not(id: user.id)
  end

  def identifier
    username
  end

  def most_recent_correspondent_id
    most_recent_greeting.receiver_id
  end

  private

  def most_recent_greeting
    greetings.newest_first.first || Greeting.new
  end
end
