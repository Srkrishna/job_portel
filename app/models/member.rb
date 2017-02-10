class Member < ApplicationRecord
  # validates_processing_of :photo
  validate :image_size_validation

  mount_uploader :resume, AttachmentUploader # Tells rails to use this uploader for this model.
  validates :name, presence: true # Make sure the owner's name is present.


  has_one :user
  has_many :education_qualification
  has_many :company_detail
  has_many :requested_job
  has_many :experience
  mount_uploader :photo, ImageUploader


  private

  def image_size_validation
    errors[:photo] << "should be less than 500KB" if photo.size > 0.5.megabytes
  end

end
