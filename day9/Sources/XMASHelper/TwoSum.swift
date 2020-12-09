import XMASProtocol

public func hasTwoSum(value: Int, window: XMASLookbackWindow) -> Bool {
    var seen: Set<Int> = []
    for n in window {
        if seen.contains(value - n) {
            return true
        }
        seen.insert(n)
    }
    return false
}