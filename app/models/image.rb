class Image < ActiveRecord::Base
  has_attached_file :thumbnail, styles: { medium: "300x300>", thumb: "100x100>" }
  validates_attachment_content_type :thumbnail, content_type: /\Aimage\/.*\Z/
  has_one :slide, as: :imageable, dependent: :destroy

  def has_slide?
    self.slide.present?
  end
end
