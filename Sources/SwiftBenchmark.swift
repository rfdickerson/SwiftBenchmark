import Glibc

struct SwiftBenchmark {

    var text = "Hello, World!"
}

public class BenchmarkSuite {

    var onComplete: ((Void) -> ())?

    func add(name: String, benchmarkFunction: ()->Void ) {

    }

    func run() {

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