require_relative 'student'
require_relative 'course'
require 'yaml'


class DbApi
	def self.students	
		students = YAML.load_file("university_db.yaml")
	end
	def self.select_by_gender (gender)
		return students.select { |student| student.gender == gender }
	end
	def self.select_by_first_name (first_name)
		return students.select { |student| first_name.match(student.first_name)}
	end
	def self.select_by_end_name (end_name)
		return students.select { |student| end_name.match(student.last_name)}
	end
	def self.select_by_weight_more_than (pounds)
		return students.select { |student| student.pounds > pounds }
	end
end