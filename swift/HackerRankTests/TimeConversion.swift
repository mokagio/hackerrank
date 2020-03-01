import XCTest

// https://www.hackerrank.com/challenges/time-conversion
class TimeConversion: XCTestCase {

    func timeConversion(s: String) -> String {
        guard let hour = Int(String(s[0...1])) else { return "error" }

        guard s[8] == "P" else {
            guard hour != 12 else { return "00\(String(s[2..<8]))" }
            return String(s[..<8])
        }

        guard hour != 12 else { return String(s[..<8]) }

        return "\(hour + 12)\(String(s[2..<8]))"
    }

    func test() {
        XCTAssertEqual(timeConversion(s: "07:05:45PM"), "19:05:45")
        XCTAssertEqual(timeConversion(s: "07:05:45AM"), "07:05:45")
        XCTAssertEqual(timeConversion(s: "12:05:45AM"), "00:05:45")
        XCTAssertEqual(timeConversion(s: "12:05:45PM"), "12:05:45")
    }
}

// https://stackoverflow.com/questions/24092884/get-nth-character-of-a-string-in-swift-programming-language/38215613#38215613
extension StringProtocol {

    /// "abcd"[0] // "a"
    subscript(_ offset: Int) -> Element {
        self[index(startIndex, offsetBy: offset)]
    }

    /// "abcd"[0..<2] // "ab"
    subscript(_ range: Range<Int>) -> SubSequence {
        prefix(range.lowerBound+range.count).suffix(range.count)
    }

    /// "abcd"[0...2] // "abc"
    subscript(_ range: ClosedRange<Int>) -> SubSequence {
        prefix(range.lowerBound+range.count).suffix(range.count)
    }

    /// "abcd"[...2] // "abc"
    subscript(_ range: PartialRangeThrough<Int>) -> SubSequence {
        prefix(range.upperBound.advanced(by: 1))
    }

    /// "abcd"[..<2] // "ab"
    subscript(_ range: PartialRangeUpTo<Int>) -> SubSequence {
        prefix(range.upperBound)
    }

    /// "abcd"[2...] // "cd"
    subscript(_ range: PartialRangeFrom<Int>) -> SubSequence {
        suffix(Swift.max(0, count-range.lowerBound))
    }
}

class StringSubscriptTests: XCTestCase {

    func test() {
        XCTAssertEqual("Hello World"[2], "l")
        XCTAssertEqual("Hello World"[0..<2], "He")
        XCTAssertEqual("Hello World"[0...2], "Hel")
        XCTAssertEqual("Hello World"[...2], "Hel")
        XCTAssertEqual("Hello World"[..<2], "He")
        XCTAssertEqual("Hello World"[2...], "llo World")
    }
}
