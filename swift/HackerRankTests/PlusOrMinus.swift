import XCTest

// https://www.hackerrank.com/challenges/plus-minus/
class PlusOrMinusTests: XCTestCase {

    struct Rates {
        let positive: Double
        let negative: Double
        let zeroes: Double
    }

    func getRates(from array: [Int]) -> Rates {
        let splitCounts = array.reduce((0,0,0)) { acc, number in
            switch number {
            case let x where x > 0: return (acc.0 + 1, acc.1, acc.2)
            case 0: return (acc.0, acc.1, acc.2 + 1)
            case _: return (acc.0, acc.1 + 1, acc.2)
            }
        }
        let count: Double = Double(array.count)

        func _round(_ value: Double) -> Double {
            let precision: Double = 1_000_000
            return round(value * precision) / precision
        }

        return Rates(
            positive: _round(Double(splitCounts.0) / count),
            negative: _round(Double(splitCounts.1) / count),
            zeroes: _round(Double(splitCounts.2) / count)
        )
    }

    func test() {
        let rates1 = getRates(from: [-4, 3, -9, 0, 4, 1])
        XCTAssertEqual(rates1.positive, 0.5)
        XCTAssertEqual(rates1.negative, 0.333333)
        XCTAssertEqual(rates1.zeroes, 0.166667)

        let rates2 = getRates(from: [-4, -3, -9, -1, -4, -1])
        XCTAssertEqual(rates2.positive, 0)
        XCTAssertEqual(rates2.negative, 1)
        XCTAssertEqual(rates2.zeroes, 0)

        let rates3 = getRates(from: [-4, -3, 9, 0, 4, 0])
        XCTAssertEqual(rates3.positive, 0.333333)
        XCTAssertEqual(rates3.negative, 0.333333)
        XCTAssertEqual(rates3.zeroes, 0.333333)
    }
}
