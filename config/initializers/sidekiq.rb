Sidekiq.configure_server do |config|
  config.redis = {
    url: 'redis://rediscloud:ZoSDUSTr6vCHmj5I@redis-13606.c11.us-east-1-2.ec2.cloud.redislabs.com:13606'
   }
end

Sidekiq.configure_client do |config|
  config.redis = {
    url: 'redis://rediscloud:ZoSDUSTr6vCHmj5I@redis-13606.c11.us-east-1-2.ec2.cloud.redislabs.com:13606'
  }
end
