import XCTest

// https://www.hackerrank.com/challenges/repeated-string
class RepeatedString: XCTestCase {

    func repeatedString(s: String, n: Int) -> Int {
        func occurrencesOfAIn(_ s: String) -> Int {
            return s.reduce(0) { acc, char in
                return char == "a" ? acc + 1 : acc
            }
        }

        let remainder = n % s.count

        return Int(n / s.count) * occurrencesOfAIn(s)
            + occurrencesOfAIn(String(s.prefix(remainder)))
    }

    func test() {
        XCTAssertEqual(repeatedString(s: "aba", n: 10), 7)
        XCTAssertEqual(repeatedString(s: "a", n: 1_000_000_000_000), 1_000_000_000_000)
    }
}
