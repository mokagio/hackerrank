import XCTest
@testable import HackerRank

class SockMerchant: XCTestCase {

    func sockMerchant(n: Int, ar: [Int]) -> Int {
        return Array(Set(ar))
            .map { color in Int(ar.filter { $0 == color }.count / 2) }
            .reduce(0) { acc, cur in return acc + cur }
    }

    func test() {
        XCTAssertEqual(sockMerchant(n: 9, ar: [10, 20, 20, 10, 10, 30, 50, 10, 20]), 3)
    }
}
