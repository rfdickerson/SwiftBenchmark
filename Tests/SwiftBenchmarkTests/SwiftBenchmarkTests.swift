import XCTest
@testable import SwiftBenchmark

import Foundation

class SwiftBenchmarkTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        XCTAssertEqual(SwiftBenchmark().text, "Hello, World!")

        let start = timerStart()

        let data = Data()

        let dt = timerEnd(start)

        print("Time taken is \(dt)")

    }


    static var allTests : [(String, (SwiftBenchmarkTests) -> () throws -> Void)] {
        return [
            ("testExample", testExample),
        ]
    }
}
