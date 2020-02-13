import XCTest

// https://www.hackerrank.com/challenges/jumping-on-the-clouds
class JumpingOnTheClouds: XCTestCase {

    // I tried to come up with a good formula to compute the best path, but couldn't find one.
    // Falling back to a lazy (as in, I'm lazy) imperative approach...

    func jumpingOnClouds(c: [Int]) -> Int {
        var jumps = 0
        var nextIndex = 0

        func nextBestMove(index: Int, c: [Int]) -> (jumps: Int, nextIndex: Int) {
            guard index != c.count - 1 else { return (0, 1000) }
            guard index + 2 < c.count else { return (1, 1000) }

            if c[index + 2] == 0 {
                return (1, index + 2)
            } else {
                return (2, index + 3)
            }
        }

        while nextIndex <= c.count {
            let nextMove = nextBestMove(index: nextIndex, c: c)
            jumps += nextMove.jumps
            nextIndex = nextMove.nextIndex
        }

        return jumps
    }

    func test() {
        XCTAssertEqual(jumpingOnClouds(c: [0, 0, 1, 0, 0, 1, 0]), 4)
        XCTAssertEqual(jumpingOnClouds(c: [0, 0, 0, 0, 1, 0]), 3)
        XCTAssertEqual(jumpingOnClouds(c: [0, 0, 0, 1, 0, 0]), 3)
        XCTAssertEqual(jumpingOnClouds(c: [0, 1, 0, 1, 0, 1, 0]), 3)
    }
}
