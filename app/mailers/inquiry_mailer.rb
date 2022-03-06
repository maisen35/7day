class InquiryMailer < ActionMailer::Base
  default from: "example@example.com"
  default to: "suzukixoxb5021@gmail.com"

  def received_email(inquiry)
    @inquiry = inquiry
    mail(:subject => 'お問い合わせを承りました')
  end
end