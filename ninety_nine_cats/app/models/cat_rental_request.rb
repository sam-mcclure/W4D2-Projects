# == Schema Information
#
# Table name: cat_rental_requests
#
#  id         :bigint(8)        not null, primary key
#  cat_id     :integer          not null
#  start_date :date             not null
#  end_date   :date             not null
#  status     :string           default("PENDING"), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class CatRentalRequest < ApplicationRecord
  validates :cat_id, :start_date, :end_date, presence: true
  validates :status, presence: true, inclusion: {in: %w(APPROVED DENIED PENDING)}
  validate :does_not_overlap_approved_requests
  
  
  belongs_to :cat,
    primary_key: :id,
    foreign_key: :cat_id,
    class_name: :Cat
    
  def does_not_overlap_approved_requests
    if overlapping_approved_requests.exists?
      errors.add(:start_date, "Cat has already been requested during this time.")
    end
  end  
  
  private
  
  def overlapping_requests
    CatRentalRequest.where("cat_id = #{self.cat_id}").where("start_date <= ? AND end_date >= ?", self.end_date, self.start_date)
  end
  
  def overlapping_approved_requests
    possible_overlaps = overlapping_requests
    possible_overlaps.where("status = 'APPROVED'")
  end
    
end
