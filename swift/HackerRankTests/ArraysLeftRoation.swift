import XCTest

// https://www.hackerrank.com/challenges/ctci-array-left-rotation/
class ArraysLeftRotationTests: XCTestCase {

    func rotLeft(a: [Int], d: Int) -> [Int] {
        // We need to access the count more than once, so let's store it.
        let count = a.count

        guard count > 0 else { return [] }

        // To save time, take into account the fact that rotating n times where n = the count of the
        // array returns the array.
        let rotationsToPerform = d % count

        guard rotationsToPerform != 0 else { return a }

        return Array(a[rotationsToPerform..<count] + a[0..<rotationsToPerform])
    }

    func test() {
        XCTAssertEqual(rotLeft(a: [1, 2, 3, 4, 5], d: 4), [5, 1, 2, 3, 4])
        XCTAssertEqual(rotLeft(a: [1, 2, 3, 4, 5], d: 5), [1, 2, 3, 4, 5])
        XCTAssertEqual(rotLeft(a: [1, 2, 3, 4, 5], d: 6), [2, 3, 4, 5, 1])
    }
}

extension Array {

    var head: Element? { return first }

    var tail: [Element] { return count > 1 ? Array(self[1...]) : [] }
}
