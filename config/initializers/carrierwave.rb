require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'

if Rails.env.test?
  CarrierWave.configure do |config|
    config.strage = :file
  end

else
  CarrierWave.configure do |config|
    config.storage = :fog
    config.fog_credentials = {
      provider:        'AWS',
      aws_access_key_id:   ENV['AWS_ACCESS_KEY_ID'],
      aws_secret_access_key:   ENV['AWS_SECRET_ACCESS_KEY'],
      region:     ENV['AWS_Region'],
    }
    config.fog_directory = 'chad-hp'
    config.fog_public = false
  end
end
