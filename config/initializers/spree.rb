# Configure Spree Preferences
#
# Note: Initializing preferences available within the Admin will overwrite any changes that were made through the user interface when you restart.
#       If you would like users to be able to update a setting with the Admin it should NOT be set here.
#
# Note: If a preference is set here it will be stored within the cache & database upon initialization.
#       Just removing an entry from this initializer will not make the preference value go away.
#       Instead you must either set a new value or remove entry, clear cache, and remove database entry.
#
# In order to initialize a setting do:
# config.setting_name = 'new value'
Spree.config do |config|
  Spree::PermittedAttributes.product_attributes << [:short_description,:related]
  Spree::PermittedAttributes.line_item_attributes << [:role_id_price]
  SpreeI18n::Config.available_locales = [:uk, :ru] # displayed on frontend select box
  Spree::Frontend::Config[:locale] = :uk
  Spree::Backend::Config[:locale] =:uk
  SpreeGlobalize::Config.supported_locales = [:ru, :uk] # displayed on translation forms
  Spree::Config[:currency] = "UAH"
  config.currency = 'UAH'
  config.default_country_id = 230
  config.rate
  config.last_rate
  Spree::Config.logo = "homepage/logo.png"

  Money::Currency.register({
    :priority        => 1,
    :subunit_to_unit => 100,
    :iso_code        => 'UAH',
    :name            => "Ukrainian Hryvnia",
    :symbol          => "₴",
    :subunit         => "Kopiyka",
    :iso_numeric     => 230,
    :html_entity     => "&#x20B4;",
    :delimiter       => '.',
    :separator       => "."
  })

end

# Configure Spree Dependencies
#
# Note: If a dependency is set here it will NOT be stored within the cache & database upon initialization.
#       Just removing an entry from this initializer will make the dependency value go away.
#
Spree.dependencies do |dependencies|
  # Example:
  # Uncomment to change the default Service handling adding Items to Cart
  # dependencies.cart_add_item_service = 'MyNewAwesomeService'
end


Spree.user_class = "Spree::User"
