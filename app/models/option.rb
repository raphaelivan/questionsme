class Option < ActiveRecord::Base
  belongs_to :ask
  has_many :reply_options
end
