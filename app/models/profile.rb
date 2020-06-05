class Profile < ApplicationRecord
  belongs_to user;

  validates :nickname, length: { minimum: 2 }
  validates :description, length: { maximum: 500 }
  validates :telefon, length: { is: 11 }
  validates :nickname, presence: true
  validates :nickname, uniqueness: true
end
