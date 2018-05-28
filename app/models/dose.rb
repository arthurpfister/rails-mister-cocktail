class Dose < ApplicationRecord
  belongs_to :ingredients
  belongs_to :cocktail

  validates :description, presence: true
  validates_uniqueness_of :cocktail, :scope => [:ingredient]

end
