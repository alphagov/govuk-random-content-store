require 'sinatra'
require 'json'
require 'http'
require 'active_support/cache'
require 'govuk_schemas'

set :cache, ActiveSupport::Cache::MemoryStore.new

get '/' do
  known_formats = YAML.load_file('config/schema_names.yml')

  schemas_and_urls = known_formats.reduce({}) do |hash, schema_name|
    hash[schema_name] = "https://govuk-random-content-store.herokuapp.com/content/#{schema_name}"
    hash
  end

  schemas_and_urls.to_json
end

get '/content/:schema_name' do |schema_name|
  schema = get_schema(schema_name)
  generator = GovukSchemas::RandomExample.new(schema: schema)
  payload = generator.merge_and_validate(base_path: "/content/#{schema_name}")
  payload.to_json
end

def get_schema(schema_name)
  settings.cache.fetch(schema_name, expires_in: 5.minutes) do
    response = HTTP.get("https://raw.githubusercontent.com/alphagov/govuk-content-schemas/master/dist/formats/#{schema_name}/frontend/schema.json")
    raise Sinatra::NotFound unless response.status.success?
    JSON.parse(response.body)
  end
end
