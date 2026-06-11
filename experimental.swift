import Foundation

// MARK: - Symbol type (pure symbolic, no numeric meaning)
struct Symbol: Equatable {
    let name: String
}

// MARK: - Your primitives
let A = Symbol(name: "1 antimodulo 1")
let B = Symbol(name: "3 antimodulo 2")

let states = [A, B]

// MARK: - Your logic rule (IMPORTANT)

// I defined:
/// 1 antimodulo 1 AND 3 antimodulo 2 = 1 antimodulo 1
/// So AND always returns the LEFT operand

func AND(_ x: Symbol, _ y: Symbol) -> Symbol {
    return x
}

func OR(_ x: Symbol, _ y: Symbol) -> Symbol {
    return y
}

// Optional derived symbolic gates
func XOR(_ x: Symbol, _ y: Symbol) -> Symbol {
    return (x == y) ? x : Symbol(name: "3 antimodulo 2")
}

func NAND(_ x: Symbol, _ y: Symbol) -> Symbol {
    return Symbol(name: "NOT(\(AND(x,y).name))")
}

func NOR(_ x: Symbol, _ y: Symbol) -> Symbol {
    return Symbol(name: "NOT(\(OR(x,y).name))")
}

// MARK: - Printer

func printTable(_ title: String, _ op: (Symbol, Symbol) -> Symbol) {

    print("\n=== \(title) ===")
    print("A\t\t\tOP\tB\t\t\t=\tRESULT")
    print("--------------------------------------------------------")

    for x in states {
        for y in states {
            let r = op(x, y)
            print("\(x.name)\t\(title)\t\(y.name)\t=\t\(r.name)")
        }
    }
}

// MARK: - Run

print("SYMBOLIC LOGIC SYSTEM\n")

printTable("AND", AND)
printTable("OR", OR)
printTable("XOR", XOR)
printTable("NAND", NAND)
printTable("NOR", NOR)
