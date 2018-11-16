Apipie.configure do |config|
  config.app_name                = "CatalogueApi"
  config.api_base_url            = "/v1"
  config.doc_base_url            = "/doc"
  config.use_cache               = Rails.env.production?
  config.reload_controllers = true
  # where is your API defined?
  config.api_controllers_matcher = "#{Rails.root}/app/controllers/**/*.rb"
  config.translate = false
end
