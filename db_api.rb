require_relative "student"
require_relative "course"
require "yaml"

class DbApi
	def self.method_missing (method, *args) 
		@@students ||= YAML.load_file("university_db.yaml")
		parts = method.to_s.split("select_students_where_")
		field = parts[1]
		return @@students.select { |student| student.send(field).send(args[0], args[1]) }
	end
end