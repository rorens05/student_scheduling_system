require 'faker'

Grade.create(id: 7, grade: "GRADE 7", description: 'Formerly called 1st year highschool')
Grade.create(id: 8, grade: "GRADE 8", description: 'Formerly called 2nd year highschool')
Grade.create(id: 9, grade: "GRADE 9", description: 'Formerly called 3rd year highschool')
Grade.create(id: 10, grade: "GRADE 10", description: 'Formerly called 4th year highschool')

Curriculum.create(name: "SPA", description: 'Special Program in Arts')
Curriculum.create(name: "REG", description: 'Regular Students')
Curriculum.create(name: "STE", description: 'Science, Technology and Engineering')
Curriculum.create(name: "SPS", description: 'Special Program in Sports')

(1..500).each do 
    Student.create(name: Faker::Name.unique.name, student_no: Faker::Number.leading_zero_number(8), grade_id: Faker::Number.within(7..10), school_year: Faker::Number.within(2017..2019), average: Faker::Number.within(75..99), cur_name: "REG")
end

(1..500).each do 
    Student.create(name: Faker::Name.unique.name, student_no: Faker::Number.leading_zero_number(8), grade_id: Faker::Number.within(7..10), school_year: Faker::Number.within(2017..2019), average: Faker::Number.within(75..99), cur_name: "SPA")
end

(1..500).each do 
    Student.create(name: Faker::Name.unique.name, student_no: Faker::Number.leading_zero_number(8), grade_id: Faker::Number.within(7..10), school_year: Faker::Number.within(2017..2019), average: Faker::Number.within(75..99), cur_name: "STE")
end

(1..500).each do 
    Student.create(name: Faker::Name.unique.name, student_no: Faker::Number.leading_zero_number(8), grade_id: Faker::Number.within(7..10), school_year: Faker::Number.within(2017..2019), average: Faker::Number.within(75..99), cur_name: "SPS")
end