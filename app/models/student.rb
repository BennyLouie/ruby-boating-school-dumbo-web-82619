class Student
    attr_reader(:name)

    @@all = []

    def initialize(name)
        @name = name

        @@all << self
    end

    def self.all
        @@all
    end

    def add_boating_test(test_name, test_status, instructor)
        BoatingTest.new(self, test_name, test_status, instructor)
    end

    def self.find_student(name)
        self.all.find do |student|
            student.name == name
        end
    end

    def tests_taken
        BoatingTest.all.select do |test|
            test.student == self
        end
    end

    def tests_passed
        self.tests_taken.select do |test|
            test.test_status == "passed"
        end
    end

    def grade_percentage
        num_tests = self.tests_taken.size
        num_passed = self.tests_passed.size
        num_passed.to_f / num_tests
    end
end
