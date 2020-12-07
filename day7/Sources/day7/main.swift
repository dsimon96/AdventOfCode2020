import Bags

typealias RecipeDict = Dictionary<String, [Ingredient]>

func canMakeFromShinyGold(
    _ name: String, 
    recipes: RecipeDict, 
    memo: inout Dictionary<String, Bool>
) -> Bool {
    if let res = memo[name] {
        return res
    } else if name == "shiny gold" {
        memo[name] = true
        return true
    } else {
        let recipe = recipes[name]!

        for ingredient in recipe {
            if canMakeFromShinyGold(ingredient.name, recipes: recipes, memo: &memo) {
                memo[name] = true
                return true
            }
        }

        memo[name] = false
        return false
    }
}

var recipes: RecipeDict = [:]
while let s = readLine(strippingNewline: true) {
    let (outputName, inputs) = parseRecipe(s)
    recipes[outputName] = inputs
}

var memo: Dictionary<String, Bool> = [:]
var total = 0
for (name, _) in recipes {
    if canMakeFromShinyGold(name, recipes: recipes, memo: &memo) {
        total += 1
    }
}

// shiny gold itself doesn't count
print(total - 1)
