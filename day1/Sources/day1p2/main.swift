var input: [Int] = []
let target = 2020

// Read input into an array so it can be iterated multiple times
while let s = readLine(strippingNewline: true) {
    let val = Int(s)!
    input.append(val)
}

outerloop: for i in 0..<input.count {
    let v1 = input[i]
    let remainingSum = target - v1

    // Of the remaining elements, we are looking for two that add to remainingSum
    var seen: Set<Int> = []
    for j in i+1..<input.count {
        let v2 = input[j]
        let v3 = remainingSum - v2

        if seen.contains(v3) {
            print(v1 * v2 * v3)
            break outerloop
        }

        seen.insert(v2)
    }
}
