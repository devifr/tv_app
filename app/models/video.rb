class Video < ActiveRecord::Base
  has_attached_file :thumbnail, styles: { medium: "300x300>", thumb: "100x100>" }
  validates_attachment_content_type :thumbnail, content_type: /\Aimage\/.*\Z/
  has_one :featured
  belongs_to :program
  accepts_nested_attributes_for :featured, reject_if: :all_blank, allow_destroy: true

  def featured?
    self.featured.present?
  end
end
