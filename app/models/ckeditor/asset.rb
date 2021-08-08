# frozen_string_literal: true
require 'active_storage'
class Ckeditor::Asset < ActiveRecord::Base
  include Ckeditor::Orm::ActiveRecord::AssetBase
  include Ckeditor::ActiveStorage

  attr_accessor :data

  has_one_attached :storage_data
end
