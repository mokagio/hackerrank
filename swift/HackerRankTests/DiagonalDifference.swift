import XCTest

// https://www.hackerrank.com/challenges/diagonal-difference
class DiagonalDifferenceTests: XCTestCase {

    func diagonalDifference(arr: [[Int]]) -> Int {
        // The code implies the input is a matrix, so no need to ensure the length is homogeneous
        // here.
        let length = arr.count
        let diagonals = (0..<length).reduce((0, 0)) { (acc: (Int, Int), index: Int) -> (Int, Int) in
            return (acc.0 + arr[index][index], acc.1 + arr[index][length - 1 - index])
        }

        return abs(diagonals.0 - diagonals.1)
    }

    func test() {
        XCTAssertEqual(
            diagonalDifference(
                arr: [
                    [11, 2, 4],
                    [4, 5, 6],
                    [10, 8, -12]
                ]
            ),
            15
        )
    }
}
