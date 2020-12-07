public struct Ingredient {
    public var count: Int = 0
    public var name: String = ""
}

public func parseRecipe(_ s: String) -> (String, [Ingredient]) {
    let tokenized = s.split(separator: " ")

    let outputName = String(tokenized[0] + " " + tokenized[1])
    let ingredientTokens = tokenized[4...]

    if ingredientTokens.count == 3 {
        // "no other bags."
        return (outputName, [])
    }

    // otherwise the remaining tokens are <number> <color name> bag(s) repeated multiple times
    let numInputs = ingredientTokens.count / 4

    var inputs: [Ingredient] = []
    for i in 0..<numInputs {
        let ingredientStart = ingredientTokens.startIndex + i * 4
        let num = Int(ingredientTokens[ingredientStart])!
        let inputName = String(ingredientTokens[ingredientStart + 1] + " " + 
            ingredientTokens[ingredientStart + 2])

        inputs.append(Ingredient(count: num, name: inputName))
    }

    return (outputName, inputs)
}
