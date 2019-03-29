class EvaluationController < ApplicationController
  def evaluate
    school_year = params[:evaluation][:school_year]
    curriculum_id = params[:evaluation][:curriculum_id]
    grade_id = params[:evaluation][:grade_id]
    no_of_student_per_section = params[:evaluation][:no_of_student_per_section]
    total_student = Student.where(grade_id: grade_id).where(school_year: school_year).where(curriculum_id: curriculum_id).count
    no_of_sections = (total_student.to_f / no_of_student_per_section.to_f).ceil
    
    puts "number of student per section: " + no_of_student_per_section.to_s
    puts "total number of student: " + total_student.to_s
    puts "total number of section: " + no_of_sections.to_s
    students = Student.where(grade_id: grade_id).where(school_year: school_year).where(curriculum_id: curriculum_id).order("average DESC")
    letters = ('A'..'Z').to_a
    
    counter = 0
    (1..no_of_sections).each do |n|
      section = Section.new
      section.name = Grade.find(grade_id).grade + " - " + Curriculum.find(curriculum_id).name + " " + letters[n - 1]
      section.school_year = school_year.to_i
      section.grade_id = grade_id.to_i
      section.curriculum_id = curriculum_id
      section.save
      puts "+++++++++++++++++++++++++++++++++++++++++++"
      puts "scheduling students"
      (1..no_of_student_per_section.to_i).each do |n|
        if counter < total_student
          temp = students[counter]
          temp.section = section
          temp.save
          counter = counter + 1
        end
      end
      puts "+++++++++++++++++++++++++++++++++++++++++++"
      puts "done scheduling students"

      SubjectClass.create(schedule: "7:40 - 8:40", section_id: section.id)
      SubjectClass.create(schedule: "8:40 - 9:40", section_id: section.id)
      SubjectClass.create(schedule: "10:00 - 11:00", section_id: section.id)
      SubjectClass.create(schedule: "11:00 - 12:00", section_id: section.id)

      SubjectClass.create(schedule: "1:00 - 2:00", section_id: section.id)
      SubjectClass.create(schedule: "2:00 - 3:00", section_id: section.id)
      SubjectClass.create(schedule: "3:00 - 4:00", section_id: section.id)
      SubjectClass.create(schedule: "4:00 - 5:00", section_id: section.id)
    end

    Student.where(grade_id: grade_id).where(school_year: school_year).where(curriculum_id: curriculum_id).order("average DESC").each do |stud|
      puts stud.name
    end

    redirect_to sections_path
  end

  def save_class
    puts params[:id]
    subject_class = SubjectClass.find(params[:id])
    subject_class.subject = params[:subject_class][:subject]
    subject_class.day = params[:subject_class][:day]
    subject_class.minutes_per_week = params[:subject_class][:minutes_per_week]
    subject_class.subject_teacher = params[:subject_class][:subject_teacher]
    subject_class.save
    redirect_to subject_class.section
  end
end
