class Employee < ActiveRecord::Base
  belongs_to :user

  validates :name, :email, presence: true
  validates :email, uniqueness: true

  # def to_param
  #   email
  # end
end
