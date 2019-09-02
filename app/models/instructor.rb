require 'pry'

class Instructor
    attr_reader(:name)

    @@all = []

    def initialize(name)
        @name = name

        @@all << self
    end

    def self.all
        @@all
    end

    def pass_student(student, test_name)
        find_test = []
        find_test = BoatingTest.all.select do |test|
            test.student == student && test.test_name == test_name
        end
        if find_test.size > 0
            find_test[0].test_status = "passed"
            find_test[0]
        else
            BoatingTest.new(student, test_name, "passed", self)
        end
    end

    def fail_student(student, test_name)
        find_test = []
        find_test = BoatingTest.all.select do |test|
            test.student == student && test.test_name == test_name
        end
        if find_test.size > 0
            find_test[0].test_status = "failed"
            find_test[0]
        else
            BoatingTest.new(student, test_name, "failed", self)
        end
    end
end
