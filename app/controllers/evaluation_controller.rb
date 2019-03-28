class EvaluationController < ApplicationController
  def evaluate
    school_year = params[:evaluation][:school_year]
    curriculum_id = params[:evaluation][:curriculum_id]
    grade_id = params[:evaluation][:grade_id]
    no_of_student_per_section = params[:evaluation][:no_of_student_per_section]

  end
end
