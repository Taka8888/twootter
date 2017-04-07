class Blog < ActiveRecord::Base
  validates :title, :content, presence:true
  validates :content, length: { maximum: 170 }
end
