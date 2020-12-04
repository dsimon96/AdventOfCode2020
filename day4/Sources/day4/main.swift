func isValidCredential(_ credentialFields: Set<String>) -> Bool {
    let expectedFields: Set<String> = ["byr", "iyr", "eyr", "hgt", "hcl", "ecl", "pid"]
    let missingFields = expectedFields.subtracting(credentialFields)
    return missingFields.isEmpty
}

var numValid = 0
var credentialFields: Set<String> = []
while let s = readLine(strippingNewline: true) {
    if s.isEmpty {
        if isValidCredential(credentialFields) {
            numValid += 1
        }
        credentialFields = []
        continue
    }

    for pair in s.split(separator: " ") {
        let kv = pair.split(separator: ":")
        credentialFields.insert(String(kv[0]))
    }
}

if isValidCredential(credentialFields) {
    numValid += 1
}

print(numValid)
