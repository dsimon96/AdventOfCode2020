var numValid = 0

while let line = readLine(strippingNewline: true) {
    let splitLine = line.split(separator: " ")

    let bounds = splitLine[0].split(separator: "-")
    let lowerBound = Int(bounds[0])!
    let upperBound = Int(bounds[1])!
    let character = splitLine[1].first!
    let password = splitLine[2]

    let numOccurrences = password.filter({(c: Character) -> Bool in
        return c == character
    }).count 

    if (lowerBound...upperBound).contains(numOccurrences) {
        numValid += 1
    }
}

print(numValid)
