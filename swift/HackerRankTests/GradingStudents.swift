import XCTest

// https://www.hackerrank.com/challenges/grading/
class GradingStudentsTests: XCTestCase {

    func gradingStudents(grades: [Int]) -> [Int] {
        return grades.map { grade in
            guard grade >= 38 else { return grade }

            let difference = 5 - (grade % 5)

            guard difference >= 3 else { return grade - (grade % 5) + 5 }

            return grade
        }
    }

    func test() {
        XCTAssertEqual(gradingStudents(grades: [73, 67, 38, 33]), [75, 67, 40, 33])
    }
}

