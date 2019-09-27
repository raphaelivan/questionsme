class Company < ActiveRecord::Base
  has_many :sectors
  has_many :questions

  validates :name, presence: true
end
