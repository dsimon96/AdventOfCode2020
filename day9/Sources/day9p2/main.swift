import ArgumentParser
import XMASHelper
import XMASProtocol

struct DecodeXMAS : ParsableCommand {
    @Argument(help: "Lookback window for XMAS cypher")
    var length: Int = 25

    mutating func validate() throws {
        guard length >= 1 else {
            throw ValidationError("Lookback window length must be at least 1")
        }
    }

    mutating func run() {
        var input: [Int] = []
        while let s = readLine(strippingNewline: true) {
            input.append(Int(s)!)
        }

        // find the first number which is not the two-sum of the previous numbers in the lookback
        // window
        var window = XMASLookbackWindow(length: length)
        var targetValue: Int = -1
        for val in input {
            if window.isFull {
                // check if val is the sum of any two numbers
                if !hasTwoSum(value: val, window: window) {
                    targetValue = val
                    break
                }
            }
            window.insert(val)
        }

        // find the smallest and largest values in the contiguous sequence that adds up to that
        // number
        var smallest: Int = 0
        var largest: Int = 0
        for startIndex in (0..<input.count) {
            var endIndex = startIndex

            let startVal = input[startIndex]
            var sum = startVal
            smallest = startVal
            largest = startVal
            while sum < targetValue {
                endIndex += 1

                let endVal = input[endIndex]
                sum += endVal
                smallest = min(smallest, endVal)
                largest = max(largest, endVal)
            }

            if sum == targetValue {
                break
            }
        }

        print(smallest + largest)
    }
}

DecodeXMAS.main()
