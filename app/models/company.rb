class Company < ActiveRecord::Base
  has_many :sectors
  has_many :questions
  has_many :employees
  # has_many :employees, through: :sectors

  validates :name, presence: true
end
