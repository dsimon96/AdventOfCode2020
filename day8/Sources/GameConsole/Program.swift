public enum Operation {
    case acc(Int)
    case jmp(Int)
    case nop(Int)
}

extension Operation {
    public init?(_ s: String) {
        let tokens = s.split(separator: " ")

        guard tokens.count == 2 else {
            return nil
        }

        guard let arg = Int(tokens[1]) else {
            return nil
        }

        switch tokens[0] {
            case "acc":
                self = .acc(arg)
            case "jmp":
                self = .jmp(arg)
            case "nop":
                self = .nop(arg)
            default:
                return nil
        }
    }

    public func eval(state: State) -> State? {
        switch self {
            case .acc(let arg):
                return State(pc: state.pc + 1, acc: state.acc + arg)
            case .jmp(let arg):
                return State(pc: state.pc + arg, acc: state.acc)
            case .nop:
                return State(pc: state.pc + 1, acc: state.acc)
        }
    }
}

public typealias Program = [Operation]

public struct State {
    public var pc: Int = 0
    public var acc: Int = 0

    public init() {}
    public init(pc: Int, acc: Int) {
        self.pc = pc
        self.acc = acc
    }
}
