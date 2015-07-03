class Item < ActiveRecord::Base
  belongs_to :list
	validates :content, presence: true


  def completed?
  	!completed_at.blank?
  end

  def puted?
  	!puted_at.blank?
  end
end
