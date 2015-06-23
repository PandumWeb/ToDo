class Item < ActiveRecord::Base
  belongs_to :list

  def completed?
  	!completed_at.blank?
  end

  def puted?
  	!puted_at.blank?
  end
end
