Rails.application.config.middleware.use OmniAuth::Builder do  
  provider :twitter, APP_CONFIG["twitter"]["key"], APP_CONFIG["twitter"]["secret"]
end

