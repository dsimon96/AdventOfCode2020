import Bags

typealias RecipeDict = Dictionary<String, [Ingredient]>

func numIngredients(
    _ name: String,
    recipes: RecipeDict,
    memo: inout Dictionary<String, Int>
) -> Int {
    if let res = memo[name] {
        return res
    }

    let recipe = recipes[name]!

    var total = 1 // the bag itself counts
    for ingredient in recipe {
        total += ingredient.count * numIngredients(ingredient.name, recipes: recipes, memo: &memo)
    }

    memo[name] = total
    return total
}

var recipes: RecipeDict = [:]
while let s = readLine(strippingNewline: true) {
    let (outputName, inputs) = parseRecipe(s)
    recipes[outputName] = inputs
}

var memo: Dictionary<String, Int> = [:]
// the outermost shiny gold doesn't count
print(numIngredients("shiny gold", recipes: recipes, memo: &memo) - 1)
