//
//  day07.swift
//  AoC2021
//
//  Created by Marcel Mravec on 26.12.2021.
//

import Foundation



enum Day07 {
    static func run() {
        
        var input1 = readFile("day07.input")
        print(input1)
        input1 = input1.replacingOccurrences(of: "\\n", with: "", options: .regularExpression)
        let numbers = input1.split(separator: ",").compactMap(Int.init)
        
        print("Initial numbers:", numbers)
        
        let median = numbers.sorted(by: <)[numbers.count / 2]
        print(median)
        var fuel = 0
        for i in 0..<numbers.count {
            fuel += abs(numbers[i]-median)
        }
        print("Fueal consumption is \(fuel).")
        fuel = 0
        
        var avg = 0.0
        var sum = 0
        /*
        for number in numbers {
            sum += number
        }*/
        sum = numbers.reduce(0,+)
        avg = (Double(sum) / Double(numbers.count))
        
        print("Avg je \(avg)")
        
        for i in 0..<numbers.count{
            
                for j in 0..<abs(numbers[i]-Int(avg)) {
                    fuel += j+1;
                }
            
        }
        print("Part2 fuel consumption is \(fuel)")

    }
}

