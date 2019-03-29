class Section < ApplicationRecord
  belongs_to :grade
  belongs_to :curriculum
  has_many :students, dependent: :destroy
  has_many :subject_classes, dependent: :destroy

  def title
    return self.name + " (#{self.room ? self.room : "No room assigned"})"
  end

  def sy
    return "SY " + self.school_year.to_s + " - " + (self.school_year + 1).to_s
  end
end
