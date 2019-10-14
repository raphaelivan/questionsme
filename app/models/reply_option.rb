class ReplyOption < ActiveRecord::Base
  belongs_to :reply
  belongs_to :option
  belongs_to :ask

  def weight
    option.weight
  end
end
