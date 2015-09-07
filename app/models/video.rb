class Video < ActiveRecord::Base
  has_attached_file :thumbnail, styles: { medium: "300x300>", thumb: "100x100>" }
  validates_attachment_content_type :thumbnail, content_type: /\Aimage\/.*\Z/
  belongs_to :program
end
