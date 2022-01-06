//
//  day02.swift
//  AoC2021
//
//  Created by Marcel Mravec on 19.12.2021.
//

import Foundation



enum Day02 {
    static func run() {
        let input1 = readFile("day02.input ")
        let movement = input1.lines.compactMap(Movement.parse)
        var tracker = PositionTracker()
        movement.forEach {
            tracker.processMovement($0)
        }
        print("Depth is now \(tracker.depth).")
        print("Position is now \(tracker.position).")
        print("Answer for day2 is \(tracker.depth * tracker.position).")
    }
}

struct PositionTracker {
    private(set) var position = 0
    private(set) var depth = 0
    private(set) var aim = 0
    
    init() {
    }
    
    mutating func processMovement(_ movement: Movement) {
        print("processing \(movement) ")
        switch movement {
        case .forward(let x):
            position += x
            depth += aim*x
        case .up(let x): aim -= x
        case .down(let x): aim += x
            
        }
    }
}

enum Movement {
    case forward(Int)
    case up(Int)
    case down(Int)
    
    static func parse(_ input: String) -> Self? {
        let parts = input.split(separator: " ")
        guard parts.count == 2 else { return nil }
        guard let amount = Int(parts[1]) else { return nil }
        switch parts[0] {
            case "forward": return .forward(amount)
            case "up": return .up(amount)
            case "down": return .down(amount)
            default: return nil
        }
    }
}

