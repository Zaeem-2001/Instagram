# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: 'muhammad.zaeem@devsinc.com'
  layout 'mailer'
end
