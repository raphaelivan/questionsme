class Question < ActiveRecord::Base
  belongs_to :company
  has_many :asks, dependent: :destroy
  has_many :replies, dependent: :destroy
  
  accepts_nested_attributes_for :asks, allow_destroy: true

  before_create :generate_slug

  def to_param
    slug
  end

  private
  def generate_slug
    begin
      slug = SecureRandom.urlsafe_base64(8)
    end while Question.where(slug: slug).exists?
    self.slug = slug
  end

end
