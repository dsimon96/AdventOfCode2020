
var total = 0
var seen: Set<Character> = []
while let s = readLine(strippingNewline: true) {
    if s.isEmpty {
        total += seen.count
        seen = []
        continue
    }

    for c in s {
        seen.insert(c)
    }
}
total += seen.count

print(total)
