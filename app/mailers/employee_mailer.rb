class EmployeeMailer < ApplicationMailer
  default from: 'from@example.com'
  layout 'mailer'

  def welcome_email(employee)
    @employee = employee
    @url  = 'http://example.com/login'
    delivery_options = { employee_name: "Not Google",
       password: company.smtp_password,
       address: company.smtp_host }
    mail(
      to: @employee.email,
      subject: 'Welcome to My Awesome Company',
      delivery_method_options: delivery_options
    )
  end
end


    mail(to: @employee.email,
         subject: "Please see the Terms and Conditions attached",
         delivery_method_options: delivery_options)
