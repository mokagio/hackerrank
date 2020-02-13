import XCTest

// https://www.hackerrank.com/challenges/equality-in-a-array/
class EqualizeTheArray: XCTestCase {

    // This less elegant code wise that the solution below, but faster as it loops only once.
    func equalizeArray(arr: [Int]) -> Int {
        var occurrencesMap: [Int: Int] = [:]
        var currentMax: (num: Int, value: Int)?

        arr.forEach { num in
            let newPossibleMax: (num: Int, value: Int)
            if let currentOccurrence = occurrencesMap[num] {
                let newValue = currentOccurrence + 1
                occurrencesMap[num] = newValue
                newPossibleMax = (num, newValue)
            } else {
                occurrencesMap[num] = 1
                newPossibleMax = (num, 1)
            }

            guard let _currentMax = currentMax else {
                currentMax = newPossibleMax
                return
            }

            if newPossibleMax.value > _currentMax.value {
                currentMax = newPossibleMax
            }
        }

        return arr.count - currentMax!.value
    }

    func equalizeArray_tooSlow(arr: [Int]) -> Int {
        // Get a map of how many times each number appears in the array
        var occurrencesMap: [Int: Int] = [:]
        arr.forEach { num in
            guard let currentOccurrence = occurrencesMap[num] else {
                occurrencesMap[num] = 1
                return
            }

            occurrencesMap[num] = currentOccurrence + 1
        }

        // Now, find out which number appears more often
        struct Number {
            let value: Int
            let occurrence: Int
        }

        let mostOccurring = occurrencesMap
            .enumerated()
            .map { Number(value: $0.element.key, occurrence: $0.element.value) }
            .sorted { $0.occurrence > $1.occurrence }
            .first!

        // The only problem I have with this solution is that it iterates quite a few times over the
        // input array. That is, it's quite expensive computationally.
        return arr.count - mostOccurring.occurrence
    }

    func test() {
        XCTAssertEqual(equalizeArray(arr: [3, 3, 2, 1, 3]), 2)
        XCTAssertEqual(equalizeArray(arr: [3, 3, 3, 1, 3]), 1)
        XCTAssertEqual(equalizeArray(arr: [3, 5, 4, 1, 2]), 4)
    }
}
