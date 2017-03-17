import XCTest
@testable import SwiftBenchmark

import Foundation

class SwiftBenchmarkTests: XCTestCase {

    func testTimer() {

        let start = timerStart()

        let data = Data()

        let dt = timerEnd(start)

        print("Time taken is \(dt)")

    }

    func testBenchmarkSuite() {

        let suite = BenchmarkSuite()

        suite.add("create data") {
            let data = Data()
        }

        suite.run()

    }


    static var allTests : [(String, (SwiftBenchmarkTests) -> () throws -> Void)] {
        return [
            ("testTimer", testTimer),
            ("testBenchmarkSuite", testBenchmarkSuite)
        ]
    }
}
