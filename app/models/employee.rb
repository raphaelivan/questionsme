class Employee < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :rememberable

  validates :name, :email, presence: true
  validates :email, uniqueness: true

  before_save :create_password!
  belongs_to :company

  has_many :replies, dependent: :destroy

  def years
    (born.year - Time.now.year)
  end
  
  private
  def create_password!
    self.password = email.split('@')[0]
  end
end
