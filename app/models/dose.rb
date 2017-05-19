class Dose < ApplicationRecord
  belongs_to :cocktail
  belongs_to :ingredient

  validates :desc, presence: true
end
