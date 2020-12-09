public struct XMASLookbackWindow: Sequence {
    public typealias Iterator = Array<Int>.Iterator

    private var array: [Int] = []
    private var length: Int
    private var nextIndex: Int = 0

    public init(length: Int) {
        self.length = length
    }

    public var isFull: Bool {
        return array.count == length
    }

    public subscript(index: Int) -> Int {
        return array[index]
    }

    public mutating func insert(_ elem: Int) {
        if array.count < length {
            array.append(elem)
        } else {
            array[nextIndex] = elem
            nextIndex += 1
            nextIndex %= length
        }
    }

    public func makeIterator() -> Iterator {
        return array.makeIterator()
    }
}
