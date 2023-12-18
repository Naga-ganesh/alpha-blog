class Article < ApplicationRecord
  belongs_to :user
  validates :title, presence: true, length: { minimum: 5, maximux: 100}
  validates :description, presence: true, length: { minimum: 10, maximux: 100}

end
