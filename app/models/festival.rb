class Festival < ApplicationRecord
  validates :title, uniqueness: true
end
