class Sector < ActiveRecord::Base
  belongs_to :company
  has_many :employees

  validates :name, :email, :company_id, presence: true
end
