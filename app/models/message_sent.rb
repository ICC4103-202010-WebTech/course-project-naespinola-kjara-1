class MessageSent < ApplicationRecord
  belongs_to :mailbox
  belongs_to :message
end
