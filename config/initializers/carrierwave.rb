CarrierWave.configure do |config|
  config.fog_credentials = {

    provider: 'AWS', # required
    aws_access_key_id: 'AKIAJI6SYRBKD46U7BZA', # required
    aws_secret_access_key: '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' # required
  }
  config.fog_directory = 'armoire-army' # required
end
