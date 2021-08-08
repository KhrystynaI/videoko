require 'digest'

module Spree
  module NavigationHelper
    def spree_navigation_data
    taxons =  Spree::Taxon.where(depth:0, hide_from_nav: false).includes(:translations).sort_by{|c|c.position}
    taxons.map do |t|
        {id: t.id, title: t.name, url: t.permalink, items: t.children.includes(:translations).map{|tax| {title: tax.name, url: tax.permalink}}}
      end
    rescue
      []
    end

    def for_index_first
      taxons = []
      taxons.push(Spree::Taxon.where(depth:0, hide_from_nav: false).includes(:translations).find_by(position: 1))
      taxons.push(Spree::Taxon.where(depth:0, hide_from_nav: false).includes(:translations).find_by(position: 3))
      taxons.push(Spree::Taxon.where(depth:0, hide_from_nav: false).includes(:translations).find_by(position: 5))
      taxons
    end

    def for_index_last
      taxons = []
      taxons.push(Spree::Taxon.where(depth:0, hide_from_nav: false).includes(:translations).find_by(position: 2))
      taxons.push(Spree::Taxon.where(depth:0, hide_from_nav: false).includes(:translations).find_by(position: 4))
      taxons.push(Spree::Taxon.where(depth:0, hide_from_nav: false).includes(:translations).find_by(position: 6))
      taxons  end

    def spree_nav_cache_key(section = 'header')
      base_cache_key + [current_store, spree_navigation_data_cache_key, try_spree_current_user, Spree::Config[:logo], section]
    end

    def main_nav_image(image_path, title = '')
      image_url = asset_path(asset_exists?(image_path) ? image_path : 'noimage/plp.png')

      lazy_image(
        src: image_url,
        alt: title,
        width: 350,
        height: 234
      )
    end

    private

    def spree_navigation_data_cache_key
     @spree_navigation_data_cache_key ||= Digest::MD5.hexdigest(spree_navigation_data.to_s)
    end
  end
end
