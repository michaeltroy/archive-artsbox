class ActionMailer::Base

  def perform_delivery_activerecord(mail)
    mail.destinations.each do |destination|
      Email.create :mail => mail.encoded, :to => destination, :from => mail.from.first
    end
  end

end