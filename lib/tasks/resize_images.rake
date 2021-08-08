namespace :resize_images do
  desc 'resize too big images'
  task optimize: :environment do
    Spree::Image.all.each do |image|
        blob = image.attachment.blob
        path = ActiveStorage::Blob.service.send(:path_for,image.attachment.blob.key)
        if ActiveStorage::Blob.service.exist?(path)
        picture = MiniMagick::Image.open(path)
      if picture.dimensions[0] > 800
        picture.resize "800x800"
        picture.write(path)
        blob.update_column(:checksum, Digest::MD5.base64digest(File.read(blob.service.path_for(blob.key))))
      end
    else
      image.attachment.purge
    end
  end
  end
end
