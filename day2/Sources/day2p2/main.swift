var numValid = 0

while let line = readLine(strippingNewline: true) {
    let splitLine = line.split(separator: " ")

    let bounds = splitLine[0].split(separator: "-")
    let i = Int(bounds[0])!
    let j = Int(bounds[1])!
    let character = splitLine[1].first!
    let password = splitLine[2]

    let iIsChar = password[password.index(password.startIndex, offsetBy: i-1)] == character
    let jIsChar = password[password.index(password.startIndex, offsetBy: j-1)] == character

    if iIsChar && !jIsChar || !iIsChar && jIsChar { 
        numValid += 1
    }
}

print(numValid)
