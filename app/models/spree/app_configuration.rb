require 'spree/core/search/base'

module Spree
  class AppConfiguration < Preferences::Configuration
    # Alphabetized to more easily lookup particular preferences
    preference :address_requires_state, :boolean, default: false # should state/state_name be required
    preference :address_requires_phone, :boolean, default: true # Determines whether we require phone in address
    preference :admin_interface_logo, :string, default: 'admin/logo.png'
    preference :admin_path, :string, default: '/admin'
    preference :admin_products_per_page, :integer, default: Kaminari.config.default_per_page
    preference :admin_orders_per_page, :integer, default: Kaminari.config.default_per_page
    preference :admin_properties_per_page, :integer, default: Kaminari.config.default_per_page
    preference :admin_promotions_per_page, :integer, default: Kaminari.config.default_per_page
    preference :admin_customer_returns_per_page, :integer, default: Kaminari.config.default_per_page
    preference :admin_users_per_page, :integer, default: Kaminari.config.default_per_page
    preference :admin_show_version, :boolean, default: true
    preference :allow_checkout_on_gateway_error, :boolean, default: false
    preference :allow_guest_checkout, :boolean, default: true
    preference :alternative_shipping_phone, :boolean, default: false # Request extra phone for ship addr
    preference :always_include_confirm_step, :boolean, default: false # Ensures confirmation step is always in checkout_progress bar, but does not force a confirm step if your payment methods do not support it.
    preference :always_put_site_name_in_title, :boolean, default: true
    preference :title_site_name_separator, :string, default: '-' # When always_put_site_name_in_title is true, insert a separator character before the site name in the title
    preference :auto_capture, :boolean, default: false # automatically capture the credit card (as opposed to just authorize and capture later)
    preference :auto_capture_on_dispatch, :boolean, default: false # Captures payment for each shipment in Shipment#after_ship callback, and makes Shipment.ready when payment authorized.
    preference :binary_inventory_cache, :boolean, default: false # only invalidate product cache when a stock item changes whether it is in_stock
    preference :checkout_zone, :string, default: nil # replace with the name of a zone if you would like to limit the countries
    preference :company, :boolean, default: false # Request company field for billing and shipping addr
    preference :currency, :string, default: 'UAH'
    preference :default_country_id, :integer
    preference :expedited_exchanges, :boolean, default: false # NOTE this requires payment profiles to be supported on your gateway of choice as well as a delayed job handler to be configured with activejob. kicks off an exchange shipment upon return authorization save. charge customer if they do not return items within timely manner.
    preference :expedited_exchanges_days_window, :integer, default: 14 # the amount of days the customer has to return their item after the expedited exchange is shipped in order to avoid being charged
    preference :layout, :string, default: 'spree/layouts/spree_application'
    preference :logo, :string, default: 'homepage/logo.png'
    preference :max_level_in_taxons_menu, :integer, default: 1 # maximum nesting level in taxons menu
    preference :products_per_page, :integer, default: 12
    preference :require_master_price, :boolean, default: false
    preference :restock_inventory, :boolean, default: true # Determines if a return item is restocked automatically once it has been received
    preference :return_eligibility_number_of_days, :integer, default: 365
    preference :send_core_emails, :boolean, default: true # Default mail headers settings
    preference :shipping_instructions, :boolean, default: false # Request instructions/info for shipping
    preference :show_only_complete_orders_by_default, :boolean, default: true
    preference :show_variant_full_price, :boolean, default: false # Displays variant full price or difference with product price. Default false to be compatible with older behavior
    preference :show_products_without_price, :boolean, default: false
    preference :show_raw_product_description, :boolean, default: true
    preference :tax_using_ship_address, :boolean, default: true
    preference :track_inventory_levels, :boolean, default: true # Determines whether to track on_hand values for variants / products.
    preference :rate, :decimal
    preference :last_rate, :decimal
    preference :cache_option_type, :integer, default: 0
    preference :first_mob, :string, default: '(099) 295-2-295'
    preference :second_mob, :string, default: '(063) 295-2-295'
    preference :viber, :string, default: '(097) 295-2-295'
    preference :telegram, :string, default: '(097) 295-2-295'
    preference :admin_phone, :string, default: '+3800992952295'
    preference :first_phone, :string, default: '(032) 295-1-295'
    preference :second_phone, :string, default: '(032) 295-2-295'
    preference :email, :string, default: 'videoko@ukr.net'
    preference :street_uk, :string, default: 'Шевченка, 120'
    preference :street_ru, :string, default: 'Шевченка, 120'
    preference :hours_week, :string, default: '09.00-18.00'
    preference :hours_weekend, :string, default: '09.00-15.00'
    preference :email_admin, :string, default: 'videoko@ukr.net'
    preference :title_for_footer, :string, default: 'Акція'
    # Store credits configurations
    preference :non_expiring_credit_types, :array, default: []
    preference :credit_to_new_allocation, :boolean, default: false

    # searcher_class allows spree extension writers to provide their own Search class
    def searcher_class
      @searcher_class ||= Spree::Core::Search::Base
    end

    attr_writer :searcher_class
  end
end
