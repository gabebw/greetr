class User < ActiveRecord::Base
  has_many :yos, foreign_key: :sender_id

  def self.except(user)
    where.not(id: user.id)
  end
end
