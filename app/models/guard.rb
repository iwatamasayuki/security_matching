class Guard < ApplicationRecord
  with_options presence: true do
    validates :company
    validates :image
    validates :guard_name
    validates :name_kana
    validates :gender
    validates :age,        numericality: { greater_than_or_equal_to: 18, less_than_or_equal_to: 80 }
    validates :experience
    validates :qualification
  end
  belongs_to :user
  has_many :messages
  has_one_attached :image
end
