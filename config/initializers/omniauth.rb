<<<<<<< HEAD



=======
>>>>>>> f1fea5c33f3ad2e46ba2a3bd03014a89da8f665e
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :github, ENV["GITHUB_CLIENT_ID"], ENV["GITHUB_CLIENT_SECRET"], scope: "user:email"
end
