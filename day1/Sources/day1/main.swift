let target = 2020

var seen: Set<Int> = []
while let s = readLine(strippingNewline: true) {
    let v1 = Int(s)!
    let v2 = target - v1

    if seen.contains(v2) {
        print(v1 * v2)
        break
    } 

    seen.insert(v1)
}
