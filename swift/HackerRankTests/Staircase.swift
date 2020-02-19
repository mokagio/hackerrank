import XCTest

// https://www.hackerrank.com/challenges/staircase

extension String {
    func repeated(_ n: Int) -> String {
        guard n > 0 else { return "" }
        guard n > 1 else { return self }

        return (1...n).map { _ in self }.reduce("") { $0 + $1 }
    }
}

class StaircaseTests: XCTestCase {

    func staircaseWithLength(_ length: Int) -> String {
        return (1...length)
            .map { " ".repeated(length - $0) + "#".repeated($0) }
            .joined(separator: "\n")
    }

    func test() {
        XCTAssertEqual(
            staircaseWithLength(3), """
  #
 ##
###
"""
        )

        XCTAssertEqual(
            staircaseWithLength(6), """
     #
    ##
   ###
  ####
 #####
######
"""
        )
    }
}

