//
//  day08.swift
//  AoC2021
//
//  Created by Marcel Mravec on 29.12.2021.
//

import Foundation

enum Day08 {
    static func run() {
        
        var input = readFile("day08.input")
        let displays = input.lines.map(Display.init)
        print("displays: \(displays)")
        let count = displays
            .flatMap(\.outputDigits)
            .filter { d in
            isOne(d) || isFour(d) || isSeven(d) || isEight(d)
            }.count
        
        print(count)
        
        
    }
    static func isOne(_ segments: String) -> Bool {
        segments.count == 2
    }
    
    static func isFour(_ segments: String) -> Bool {
        segments.count == 4
    }
    
    static func isSeven(_ segments: String) -> Bool {
        segments.count == 3
    }
    
    static func isEight(_ segments: String) -> Bool {
        segments.count == 7
    }
}

struct Display {
    let patterns: [String]
    let outputDigits: [String]
    
    init(_ input: String) {
        let parts = input.split(separator: "|")
        assert(parts.count == 2)
        patterns = parts[0].split(separator: " ").map(String.init)
        outputDigits = parts[1].split(separator: " ").map(String.init)
        
    }

    
}
