Searchkick.client =
  Elasticsearch::Client.new(url: Rails.application.credentials[Rails.env.to_sym][:host_search], retry_on_failure: true, transport_options: {request: {timeout: 250}}) 
