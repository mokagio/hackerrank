import XCTest

// https://www.hackerrank.com/challenges/mini-max-sum
class MiniMaxSumTests: XCTestCase {

    func minAndMaxSumFrom(_ array: [Int]) -> (Int, Int) {
        guard array.isEmpty == false else { return (0,0) }
        let elementsToSum = max(array.count - 2, 0)
        let sorted = array.sorted()
        return (
            sorted[0...elementsToSum].reduce(0) { $0 + $1 },
            sorted[(array.count - elementsToSum - 1)...max(array.count - 1, 0)].reduce(0) { $0 + $1 }
        )
    }

    func test() {
        XCTAssertEqual(minAndMaxSumFrom([1, 2, 3, 4, 5]).0, 10)
        XCTAssertEqual(minAndMaxSumFrom([1, 2, 3, 4, 5]).1, 14)

        XCTAssertEqual(minAndMaxSumFrom([1, 1, 1, 1]).0, 3)
        XCTAssertEqual(minAndMaxSumFrom([1, 1, 1, 1]).1, 3)

        XCTAssertEqual(minAndMaxSumFrom([]).0, 0)
        XCTAssertEqual(minAndMaxSumFrom([]).1, 0)
    }
}

