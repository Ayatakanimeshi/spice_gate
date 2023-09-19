CarrierWave.configure do |config|
    # AWSの設定
    config.storage = :fog
    config.fog_provider = 'fog/aws'
    config.fog_credentials = {
      provider: 'AWS',
      aws_access_key_id: ENV.fetch('AWS_ACCESS_KEY_ID'),
      aws_secret_access_key: ENV.fetch('AWS_SECRET_ACCESS_KEY'),
      region: 'ap-northeast-1' # 使用するリージョンを入力（例: 'ap-northeast-1'）
    }
    config.fog_directory  = 'spice-gate' # 作成したS3バケットの名前を入力
    config.fog_public     = false # publicにはしない
    config.fog_attributes = { 'Cache-Control' => "max-age=#{365.days.to_i}" } # キャッシュ設定
  end
  