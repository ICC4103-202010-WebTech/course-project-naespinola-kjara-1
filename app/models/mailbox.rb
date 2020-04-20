class Mailbox < ApplicationRecord
  belongs_to :user
  has_many :message_receiveds
  has_many :message_sents
end
