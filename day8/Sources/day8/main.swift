import GameConsole

var prog: Program = []
while let s = readLine(strippingNewline: true) {
    prog.append(Operation(s)!)
}

var state = State()
var visited: Set<Int> = []
while !visited.contains(state.pc) {
    visited.insert(state.pc)
    let operation = prog[state.pc]
    state = operation.eval(state: state)!
}

print(state.acc)
