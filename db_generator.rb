require 'yaml'
require 'csv'
require_relative 'student'
require_relative 'course'

students = Array.new
curr_id = 1
courses = [Course.new("Course 1", 1), Course.new("Course 2", 2), Course.new("Course 3", 3), Course.new("Course 4", 4)]
CSV.foreach("students.csv", headers:true) do |row|
	student = Student.new do |s|
		s.first_name = row['GivenName']
		s.last_name = row['Surname']
		s.state = row['State']
		s.city = row['City']
		s.email = row['EmailAddress']
		s.gender = row['Gender']
		s.pounds = row['Pounds'].to_i
		s.student_id = curr_id++
		s.gpa = rand(2.0..4.0).to_f
		s.taking_courses = courses.sample(rand(0..4))
	end
	students << student
end

File.write('university_db.yaml', students.to_yaml)