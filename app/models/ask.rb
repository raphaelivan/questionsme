class Ask < ActiveRecord::Base
  belongs_to :question
  has_many :options, dependent: :destroy

  accepts_nested_attributes_for :options, allow_destroy: true
end
