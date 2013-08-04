class SmsService
  def send_sms(patient, message_body)
    if recipient = patient.phone
      client.account.sms.messages.create(
        to:   recipient,
        from: config[:twilio_number],
        body: message_body
      )
    end
  end

  def client
    @client ||= Twilio::REST::Client.new(config[:account_sid], config[:auth_token])
  end

  def config
    Rails.application.config.twilio
  end
end
