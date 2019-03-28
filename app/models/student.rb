class Student < ApplicationRecord
  belongs_to :curriculum

  before_validation :update_curriculum

  validates :name, presence: true
  validates :student_no, presence: true
  validates :school_year, presence: true
  validates :average, presence: true
  

  attr_accessor :cur_name

  def full_school_year
      school_year + " - " + (school_year.to_i + 1).to_s
  end
    
  def self.import(file)
    spreadsheet = open_spreadsheet(file)
    if spreadsheet == 0
      "invalid file"
    else
      header = spreadsheet.row(1)
      (2..spreadsheet.last_row).each do |i|
        row = Hash[[header, spreadsheet.row(i)].transpose]
        student = find_by_student_no(row["student_no"]) || new
        puts student.name ? student.name : "noname"
        
        student.attributes = row.to_hash
        student.update_curriculum
        student.save!
      end
      "Student imported"
    end
  end

  def update_curriculum
    cur = Curriculum.find_by_name(cur_name) 
    puts cur_name
    if cur
      self.curriculum = cur
    else
      self.curriculum = Curriculum.first
    end
    puts cur.name
  end

  private
  def self.open_spreadsheet(file)
    case File.extname(file.original_filename)
    when ".csv" then Csv.new(file.path, nil, :ignore)
    when ".xls" then Roo::Excel.new(file.path, nil, :ignore)
    when ".xlsx" then Roo::Excelx.new(file.path)
    else 0
    end
  end

end
