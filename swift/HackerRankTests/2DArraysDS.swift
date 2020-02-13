import XCTest

class _2DArrayDS: XCTestCase {

    func hourglassSum(arr: [[Int]]) -> Int {
        func extractHourglassSum(from a: [[Int]], x: Int, y: Int) -> Int {
            guard y <= 3, x <= 3 else { return 0 }
            return a[y][x] + a[y][x + 1] + a[y][x + 2] +
                a[y + 1][x + 1] +
                a[y + 2][x] + a[y + 2][x + 1] + a[y + 2][x + 2]
        }

        let range = 0...3

        var sums = [Int]()
        range.forEach { y in
            range.forEach { x in
                sums.append(extractHourglassSum(from: arr, x: x, y: y))
            }
        }

        return sums.max() ?? 0
    }

    func test() {
        XCTAssertEqual(hourglassSum(arr: arrayfy("""
1 1 1 0 0 0
0 1 0 0 0 0
1 1 1 0 0 0
0 0 2 4 4 0
0 0 0 2 0 0
0 0 1 2 4 0
"""
            )), 19
        )

        XCTAssertEqual(hourglassSum(arr: arrayfy("""
1 1 1 0 0 0
0 1 0 0 0 0
1 1 1 0 0 0
0 0 0 9 9 9
0 0 0 1 9 0
0 0 1 9 9 9
"""
            )), 9 * 7
        )
    }

    func arrayfy(_ string: String) -> [[Int]] {
        string
            .filter { $0 != " " }
            .split(separator: "\n")
            .map { String($0).map { $0.wholeNumberValue ?? 0 } }
    }
}


