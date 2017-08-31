class TinymceImage < ActiveRecord::Base
  mount_uploader :file, ImageUploader



end
