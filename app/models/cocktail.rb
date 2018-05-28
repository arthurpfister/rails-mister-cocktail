class Cocktail < ApplicationRecord
  has_many :doses, dependent: :destroy
  has_many :ingredients, through: :doses, dependent: :destroy

  validates :name, presence: true, uniqueness: true

  private

  def check
    if self.any.doses?
      raise ActiveRecord::InvalidForeignKey
    end
  end

end
