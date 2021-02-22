class Guard < ApplicationRecord
  with_options presence: true do
    validates :company
    validates :image
    validates :guard_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/, message: 'Full-width characters' }
    validates :name_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: 'Full-width katakana characters' } 
    validates :gender
    validates :age,        numericality: { greater_than_or_equal_to: 18, less_than_or_equal_to: 80 }
    validates :experience
    validates :qualification
  end
  belongs_to :user
  has_many :messages
  has_one_attached :image
end
