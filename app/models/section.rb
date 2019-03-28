class Section < ApplicationRecord
  belongs_to :grade
  belongs_to :curriculum
  has_many :students, dependent: :destroy
end
