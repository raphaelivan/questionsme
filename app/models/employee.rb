class Employee < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :rememberable

  validates :name, :email, presence: true
  validates :email, uniqueness: true

  before_save :create_password!
  belongs_to :company

  private
  def create_password!
    self.password = email.split('@')[0]
    puts '-' * 80
    puts self.password
    puts '-' * 80
  end
end
