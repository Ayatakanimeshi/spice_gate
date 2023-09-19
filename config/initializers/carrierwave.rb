CarrierWave.configure do |config|
    config.fog_credentials = {
      provider: 'AWS',
      aws_access_key_id: ENV['AWS_ACCESS_KEY_ID'],
      aws_secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],
      region: 'ap-northeast-1' # 使用するリージョンを入力（例: 'ap-northeast-1'）
    }
    config.fog_directory  = 'spice-gate' # 作成したS3バケットの名前を入力
  end
  