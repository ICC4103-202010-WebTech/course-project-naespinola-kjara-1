class Message < ApplicationRecord
  belongs_to :user_receiver, class_name: 'User'
  belongs_to :user_transmitter, class_name: 'User'
  has_many :personal_messages, -> { order(created_at: :asc) }, dependent: :destroy

  validates :user_transmitter, uniqueness: {scope: :user_receiver}

  scope :participating, -> (user) do
    where("(messages.user_transmitter_id = ? OR messages.user_receiver_id = ?)", user.id, user.id)
  end
  scope :between, -> (sender_id, receiver_id) do
    where(user_transmitter_id: sender_id, user_receiver_id: receiver_id).or(where(user_transmitter_id: receiver_id, user_receiver_id: sender_id)).limit(1)
  end

  def with(current_person)
    author == current_person ? user_receiver : user_transmitter
  end

  def participates?(user)
    user_transmitter == user || user_receiver == user
  end
end
