var treeArr: [[Bool]] = []

while let s = readLine(strippingNewline: true) {
    var row: [Bool] = []

    for c in s {
        row.append(c == "#")
    }

    treeArr.append(row)
}

var row = 0
var col = 0

let rowDelta = 1
let colDelta = 3

var numTrees = 0
while row < treeArr.count {
    if treeArr[row][col] {
        numTrees += 1
    }

    col = (col + colDelta) % treeArr[row].count
    row += rowDelta
}

print(numTrees)
