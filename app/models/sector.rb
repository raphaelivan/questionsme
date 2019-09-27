class Sector < ActiveRecord::Base
  belongs_to :company
  has_many :employees
end
