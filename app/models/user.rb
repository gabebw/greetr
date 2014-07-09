class User < ActiveRecord::Base
  has_many :yos, foreign_key: :sender_id

  def self.except(user)
    where.not(id: user.id)
  end

  def identifier
    email
  end

  def pusher_channel_name
    "private-yos-#{id}"
  end
end
