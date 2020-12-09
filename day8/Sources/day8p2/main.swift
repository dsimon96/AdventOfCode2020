import GameConsole

var corruptedProg: Program = []
while let s = readLine(strippingNewline: true) {
    corruptedProg.append(Operation(s)!)
}

// Try changing each jmp to nop and vice versa, until one program terminates
for i in 0..<corruptedProg.count {
    var candidateProg = corruptedProg
    switch corruptedProg[i] {
        case .jmp(let arg):
            candidateProg[i] = .nop(arg)
        case .nop(let arg):
            candidateProg[i] = .jmp(arg)
        default: 
            continue
    }

    var state = State()
    var visited: Set<Int> = []
    while !visited.contains(state.pc) && state.pc < candidateProg.count {
        visited.insert(state.pc)
        let operation = candidateProg[state.pc]
        state = operation.eval(state: state)!
    }

    if state.pc == candidateProg.count {
        print(state.acc)
        break
    }
}
