//
//  day06.swift
//  AoC2021
//
//  Created by Marcel Mravec on 25.12.2021.
//

import Foundation
enum Day06 {
    static func run() {
        let numberOfDays = 18
        var input1 = readFile("day06.test")
        print(input1)
        input1 = input1.replacingOccurrences(of: "\\n", with: "", options: .regularExpression)
        var numbers = input1.split(separator: ",").compactMap(Int.init)
        
        print("Initial numbers:", numbers)
        
        
        for _ in 1...numberOfDays {
            for i in 0..<numbers.count {
                numbers[i] -= 1
                if numbers[i] < 0 {
                    numbers[i] = 6
                    numbers.append(8)
                }
            }
        print("Day \(numberOfDays):", numbers)
        }
        
        print("Number of fish after day \(numberOfDays) is \(numbers.count).")
        var finalNumber = 0
        for _ in 1...18 {
            for i in 0..<numbers.count {
                finalNumber = finalNumber + ((18 + 7 - numbers[i]) / 9)
        
            }
        }
        
        print("Final number is \(finalNumber)")
    }
}



