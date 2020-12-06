let alphabet = "abcdefghijklmnopqrstuvwxyz"
var allQuestions: Set<Character> = []
for c in alphabet {
    allQuestions.insert(c)
}

var total = 0
var groupAnswers: Set<Character> = allQuestions
while let s = readLine(strippingNewline: true) {
    if s.isEmpty {
        total += groupAnswers.count
        groupAnswers = allQuestions
        continue
    }

    var seen: Set<Character> = []
    for c in s {
        seen.insert(c)
    }

    groupAnswers.formIntersection(seen)
}
total += groupAnswers.count

print(total)
