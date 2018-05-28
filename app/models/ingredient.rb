class Ingredient < ApplicationRecord
  before_destroy :check
  has_many :doses, dependent: :destroy

  validates :name, presence: true, uniqueness: :true
end
