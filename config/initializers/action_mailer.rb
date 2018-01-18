Rails.application.config.action_mailer.default_url_options = {
  host: 'localhost:3000'
} if Rails.env.development?

Rails.application.config.action_mailer.default_url_options = {
  host: 'baby-logs.herokuapp.com'
} if Rails.env.production?
