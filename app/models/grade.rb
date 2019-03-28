class Grade < ApplicationRecord
  has_many :evaluations
  has_many :students
end
