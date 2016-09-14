class Item < ApplicationRecord
  belongs_to :user
  has_attached_file :image, styles: { itemSize: "412x232#"}
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
