OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['FACEBOOK_KEY'], ENV['FACEBOOK_SECRET'],
           # https://github.com/mkdynamic/omniauth-facebook#configuring
           :scope => 'public_profile,email,user_friends,user_location',
           :display => 'popup',
           :info_fields => 'email,gender,location,name,friends,'
end
