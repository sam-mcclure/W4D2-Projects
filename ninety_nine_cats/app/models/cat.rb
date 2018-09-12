# == Schema Information
#
# Table name: cats
#
#  id          :bigint(8)        not null, primary key
#  birth_date  :date             not null
#  color       :string           not null
#  name        :string           not null
#  sex         :string(1)        not null
#  description :text             not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Cat < ApplicationRecord
  include ActionView::Helpers::DateHelper
  
  COLORS = %w(black white orange striped grey brown)
  
  validates :birth_date, :name, :description, presence: true
  validates :color, presence: true, inclusion: { in: COLORS}
  validates :sex, presence: true, inclusion: { in: %w(M F)}
  
  has_many :cat_rental_requests,
    primary_key: :id,
    foreign_key: :cat_id,
    class_name: :CatRentalRequest,
    dependent: :destroy
  
  def self.colors 
    COLORS
  end 
  
  def age
    time_ago_in_words(birth_date)
  end
end 
