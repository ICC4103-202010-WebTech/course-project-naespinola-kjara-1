class MessageReceived < ApplicationRecord
  belongs_to :mailbox
  belongs_to :message
end
