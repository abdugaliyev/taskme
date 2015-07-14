ActionMailer::Base.smtp_settings = {
  address: 'smtp.yandex.ru',
  port: 25,
  domain:'taskme.kz',
  authentication: 'login',
  user_name: 'notification@taskme.kz',
  password: 'fheyfn3061',
  enable_starttls_auto: true
}