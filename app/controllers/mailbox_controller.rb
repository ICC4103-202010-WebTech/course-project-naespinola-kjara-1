class MailboxController < ApplicationController
  def show
    @mailbox_message_receiver = Message.where(user_receiver_id: current_person.id)
  end
end
