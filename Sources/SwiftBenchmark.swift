import Glibc

struct SwiftBenchmark {

    var text = "Hello, World!"
}

typealias TestFunction = (String, ()->Void)

public class BenchmarkSuite {

    var onComplete: ((Void) -> ())?

    var tests = [TestFunction]()

    func add(_ name: String, benchmarkFunction: @escaping ()->Void ) {

        tests.append((name, benchmarkFunction))

    }

    var testStats = [String:Double]()

    func run() {

        for test in tests {

            let (name, f ) = test

            testStats[name] = 0.0

            let start = timerStart()
            f()
            let end = timerEnd(start)

            testStats[name] = Double(end) + testStats[name]!

        }

        onComplete?()

    }

}

public func timerStart() -> timespec {

    var start_time = timespec()
    clock_gettime(CLOCK_PROCESS_CPUTIME_ID, &start_time)
    return start_time 

}

public func timerEnd(_ start_time: timespec) -> Int {
    
    var end_time = timespec()
    clock_gettime(CLOCK_PROCESS_CPUTIME_ID, &end_time)
    let diffInNanos = end_time.tv_nsec - start_time.tv_nsec
    return diffInNanos
}