# require 'carrierwave/storage/abstract'
# require 'carrierwave/storage/file'
# require 'carrierwave/storage/fog'

# CarrierWave.configure do |config|
#   config.storage = :fog
#   config.fog_provider = 'fog/aws'
#   config.fog_credentials = {
#     provider: 'AWS',
#     aws_access_key_id: Rails.application.secrets.aws_access_key_id,
#     aws_secret_access_key: Rails.application.secrets.aws_secret_access_key,
#     region: 'ap-northeast-1'
#   }

#   config.fog_directory  = 'lunch500s3'
#   config.asset_host = 'https://s3-ap-northeast-1.amazonaws.com/lunch500s3'
# end

# CarrierWaveの設定呼び出し
require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'

# 保存先の分岐
CarrierWave.configure do |config|
  if Rails.env.production? # 本番環境:AWS使用
    config.storage = :fog
    config.fog_provider = 'fog/aws'
    config.fog_credentials = {
      provider: 'AWS',
      aws_access_key_id: Rails.application.credentials.aws[:access_key_id],
      aws_secret_access_key: Rails.application.credentials.aws[:secret_access_key],
      region: 'ap-northeast-1' # 東京はap-northeast-1
    }
    config.fog_directory  = 'lunch500s3' #S3のバケット名
    config.asset_host = 'https://s3-ap-northeast-1.amazonaws.com/lunch500s3'
  else
    config.storage :file # 開発環境:public/uploades下に保存
    config.enable_processing = false if Rails.env.test? #test:処理をスキップ
  end  
end