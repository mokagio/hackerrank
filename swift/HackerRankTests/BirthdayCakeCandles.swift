import XCTest

// https://www.hackerrank.com/challenges/birthday-cake-candles/
class BirthdayCakeCandles: XCTestCase {

    func birthdayCakeCandles(ar: [Int]) -> Int {
//        var currentMaxHeight = 0
//        var count = 0
//        ar.forEach { candleHeight in
//            switch candleHeight {
//            case let h where h < currentMaxHeight:
//                break
//            case let h where h == currentMaxHeight:
//                count += 1
//            case let h where h > currentMaxHeight:
//                // found a new max height, reset the count
//                currentMaxHeight = h
//                count = 1
//            case _:
//                fatalError("This is required to make the switch exhaustive, but should not happen")
//            }
//        }

        return ar.reduce((0, 0)) { acc, current in
            switch current {
            case let h where h < acc.0:
                return acc
            case let h where h == acc.0:
                return (acc.0, acc.1 + 1)
            case let h where h > acc.0:
                return (h, 1)
            case _:
                fatalError("This is required to make the switch exhaustive, but should not happen")
            }
        }.1
    }

    func test() {
        XCTAssertEqual(birthdayCakeCandles(ar: [3, 2, 1, 3]), 2)
        XCTAssertEqual(birthdayCakeCandles(ar: [3, 2, 1, 3, 4]), 1)
    }
}

extension Dictionary {

    func updating(_ key: Key, with value: Value) -> Dictionary {
        var mutableCopy = self
        mutableCopy[key] = value
        return mutableCopy
    }
}
