import XCTest

// https://www.hackerrank.com/challenges/a-very-big-sum
class AVeryBigSumTests: XCTestCase {

    func aVeryBigSum(ar: [Int]) -> Int {
        return ar.reduce(0) { $0 + $1 }
    }


    func test() {
        XCTAssertLessThanOrEqual(
            aVeryBigSum(ar: [1000000001, 1000000002, 1000000003, 1000000004, 1000000005]),
            5000000015
        )
    }
}

