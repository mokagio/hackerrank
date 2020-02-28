import XCTest

// https://www.hackerrank.com/challenges/apple-and-orange/problem
class AppleAndOrangeTests: XCTestCase {

    struct Counts: Equatable {
        let apples: Int
        let oranges: Int
    }

    func countApplesAndOranges(
        houseStart: Int,
        houseEnd: Int,
        appleTreeLocation: Int,
        orangeTreeLocation: Int,
        appleOffsets: [Int],
        orangeOffsets: [Int]
    ) -> Counts {
        let houseRange = (houseStart...houseEnd)
        return Counts(
            apples: appleOffsets
                .filter { houseRange.contains(appleTreeLocation + $0) }
                .count,
            oranges: orangeOffsets
                .filter { houseRange.contains(orangeTreeLocation + $0) }
                .count
        )
    }

    func test() {
        XCTAssertEqual(
            countApplesAndOranges(
                houseStart: 7,
                houseEnd: 11,
                appleTreeLocation: 5,
                orangeTreeLocation: 15,
                appleOffsets: [-2, 2, 1],
                orangeOffsets: [5, -6]
            ),
            Counts(apples: 1, oranges: 1)
        )
    }
}

