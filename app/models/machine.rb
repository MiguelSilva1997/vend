class Machine < ApplicationRecord
  belongs_to :owner
  has_many :machine_snacks
  has_many :snacks, through: :machine_snacks

  def average_price
    snacks.average(:price).round(2)
  end

  def count_of
    snacks.count
  end
end
