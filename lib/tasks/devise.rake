namespace :devise do

  desc "Send password reset instructions to all users (but does not actually reset passwords)"
  task send_password_reset_instructions: :environment do
    User.find_each do |user|

      user.send_reset_password_instructions
    end
  end

   desc "DANGER: Resets all passwords AND then sends password reset instructions to all users. This will lockout all users until they reset their password."
  task reset_and_send_password_reset_instructions: :environment do
    User.find_each do |user|
      # Generate random, long password that the user will never know:
      new_password = Devise.friendly_token(50)
      user.reset_password(new_password, new_password)

        user.send_reset_password_instructions
    end
  end

end