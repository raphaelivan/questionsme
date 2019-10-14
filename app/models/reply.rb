class Reply < ActiveRecord::Base
  belongs_to :user
  belongs_to :question
  belongs_to :employee
  
  has_many :reply_options, dependent: :destroy

  def close!
    update_attributes({
      open: false, 
      end_at: Time.now
    })
  end

  def open? 
    open
  end

  def result
    10
  end
end
