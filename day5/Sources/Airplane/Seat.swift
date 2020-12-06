func decodeBsp(bspEncoded: Substring, increaseChar: Character) -> Int {
    var decoded = 0

    for c in bspEncoded {
        decoded <<= 1

        if c == increaseChar {
            decoded |= 1
        }
    }

    return decoded
}

public struct Seat {
    var row = 0
    var col = 0

    public init(_ bspEncoded: String) {
        let splitIndex = bspEncoded.index(bspEncoded.startIndex, offsetBy: 7)
        let rowPart = bspEncoded[..<splitIndex]
        let colPart = bspEncoded[splitIndex...]
        row = decodeBsp(bspEncoded: rowPart, increaseChar: "B")
        col = decodeBsp(bspEncoded: colPart, increaseChar: "R")
    }

    public func id() -> Int {
        return row * 8 + col
    }
}
