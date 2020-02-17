import XCTest

// https://www.hackerrank.com/challenges/compare-the-triplets/
class CompareTheTripletsTests: XCTestCase {

    func compareTriplets(a: [Int], b: [Int]) -> [Int] {
        return zip(a, b).reduce([0,0]) { acc, current in
            if current.0 > current.1 {
                return [acc[0] + 1, acc[1]]
            } else if current.0 < current.1 {
                return [acc[0], acc[1] + 1]
            } else {
                return acc
            }
        }
    }

    func test() {
        XCTAssertEqual(compareTriplets(a: [5, 6, 7], b: [3, 6, 10]), [1, 1])
        XCTAssertEqual(compareTriplets(a: [17, 28, 30], b: [99, 16, 8]), [2, 1])
    }
}
