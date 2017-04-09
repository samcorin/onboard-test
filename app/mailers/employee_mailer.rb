class EmployeeMailer < ApplicationMailer
  default from: 'from@example.com'
  layout 'mailer'

  def welcome_email(employee)
    @employee = employee
    @url  = 'http://example.com/login'

    delivery_options = {
      address: "smtp.gmail.com",
      authentication: "plain",
      enable_starttls_auto: true,
      user_name: ENV["GMAIL_USERNAME"],
      password: ENV["GMAIL_PASSWORD"]
    }
    mail(
      to: @employee.email,
      subject: 'Welcome to My Awesome Company',
      delivery_method_options: delivery_options
    )
  end
end
