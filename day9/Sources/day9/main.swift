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
        var window = XMASLookbackWindow(length: length)
        while let s = readLine(strippingNewline: true) {
            let val = Int(s)!
            if window.isFull {
                // check if val is the sum of any two numbers
                if !hasTwoSum(value: val, window: window) {
                    print(val)
                    break
                }
            }
            window.insert(val)
        }
    }
}

DecodeXMAS.main()
