/**
    Returns true if and only if a field's value is valid. Each field has different validation
    criteria.
 */
func isValidField(field: String, value: String) -> Bool {
    switch field {
        case "byr":
            // Check that value is a year in the given range
            return (1920...2002).contains(Int(value) ?? -1)

        case "iyr":
            // Check that value is a year in the given range
            return (2010...2020).contains(Int(value) ?? -1)

        case "eyr":
            // Check that value is a year in the given range
            return (2020...2030).contains(Int(value) ?? -1)

        case "hgt":
            // Value must be of the form <number><units>, where units is either cm or in, and
            // number falls in the valid range for the given unit
            let firstLetter = value.firstIndex(where: { $0.isLetter }) ?? value.endIndex
            let numberPart = value[..<firstLetter]
            let units = value[firstLetter...]
            switch units {
                case "cm":
                    return (150...193).contains(Int(numberPart) ?? -1)
                case "in":
                    return (59...76).contains(Int(numberPart) ?? -1)
                default:
                    return false
            }

        case "hcl":
            // Value has the prefix '#' followed by six hexadecimal digits
            return value.count == 7 && value[value.startIndex] == "#" && 
                value[value.index(after: value.startIndex)...].allSatisfy({ $0.isHexDigit })

        case "ecl":
            // Value is a valid eye color code
            let validCodes: [String] = ["amb", "blu", "brn", "gry", "grn", "hzl", "oth"]
            return validCodes.contains(value)

        case "pid":
            // Value has nine digits
            return value.count == 9 && value.allSatisfy({ $0.isWholeNumber })

        default:
            return true
    }
}

/**
    Returns true if a credential is valid. A credential is valid if it contains all expected fields
    and all fields have valid values.
 */
func isValidCredential(_ credential: [String: String]) -> Bool {
    let credentialFields = Set(credential.keys)
    let expectedFields: Set<String> = ["byr", "iyr", "eyr", "hgt", "hcl", "ecl", "pid"]
    let missingFields = expectedFields.subtracting(credentialFields)
    if !missingFields.isEmpty {
        return false
    }

    for (field, value) in credential {
        if !isValidField(field: field, value: value) {
            return false
        }
    }

    return true
}

var numValid = 0
var credential: [String: String] = [:]
while let s = readLine(strippingNewline: true) {
    if s.isEmpty {
        if isValidCredential(credential) {
            numValid += 1
        }
        credential = [:]
        continue
    }

    for pair in s.split(separator: " ") {
        let kv = pair.split(separator: ":")
        credential.updateValue(String(kv[1]), forKey: String(kv[0]))
    }
}

if isValidCredential(credential) {
    numValid += 1
}

print(numValid)
