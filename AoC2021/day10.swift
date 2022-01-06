//
//  day10.swift
//  AoC2021
//
//  Created by Marcel Mravec on 02.01.2022.
//

import Foundation

enum Day10 {
    static func run() {
        
        let input = readFile("day10.input")
        print(input)
        let values = input.lines
        var stackOfBrackets = Stack()
        var errorScore = 0
        for line in values {
            print("Tisknu line[row]: \(line).\n")
            
            for row in 0..<line.count {
                let index = line.index(line.startIndex, offsetBy: row)
                print("Tisknu po znacích: \(line[index])\n")
                switch line[index] {
                case "(": stackOfBrackets.push(line[index])
                case ")": if stackOfBrackets.peek() != nil {
                    
                    if stackOfBrackets.peek() == "(" {
                        stackOfBrackets.pop()
                        continue
                    } else {
                        print("corrupted line error score +3")
                        stackOfBrackets.myArray.removeAll()
                        errorScore += 3
                        break
                    }
                } else {
                        print("corrupted line error score +3")
                        errorScore += 3
                        stackOfBrackets.myArray.removeAll()
                        break
                }
                case "<": stackOfBrackets.push(line[index])
                    case ">": if stackOfBrackets.peek() != nil {
                        
                        if stackOfBrackets.peek() == "<" {
                            stackOfBrackets.pop()
                            continue
                        } else {
                            print("corrupted line error score +25137")
                            errorScore += 25137
                            stackOfBrackets.myArray.removeAll()
                            break
                        }
                    } else {
                            print("corrupted line error score +25137")
                            errorScore += 25137
                            stackOfBrackets.myArray.removeAll()
                            break
                    }
                    
                    
                    case "[": stackOfBrackets.push(line[index])
                    case "]": if stackOfBrackets.peek() != nil {
                        
                        if stackOfBrackets.peek() == "[" {
                            stackOfBrackets.pop()
                            continue
                        } else {
                            print("corrupted line error score +57")
                            errorScore += 57
                            stackOfBrackets.myArray.removeAll()
                            break
                        }
                    } else {
                            print("corrupted line error score +57")
                            errorScore += 57
                            stackOfBrackets.myArray.removeAll()
                            break
                    }
                    
                    case "{": stackOfBrackets.push(line[index])
                    case "}": if stackOfBrackets.peek() != nil {
                        
                        if stackOfBrackets.peek() == "{" {
                            stackOfBrackets.pop()
                            continue
                        } else {
                            print("corrupted line error score +1197")
                            errorScore += 1197
                            stackOfBrackets.myArray.removeAll()
                            break
                        }
                    } else {
                            print("corrupted line error score +1197")
                            errorScore += 1197
                            stackOfBrackets.myArray.removeAll()
                            break
                    }
                    
                    
                default: print("Chybička?")
                }
                if stackOfBrackets.peek() == nil { break }
            }
            print("Řádek je hotový ve stacku zbylo: \(stackOfBrackets)\n")
            stackOfBrackets.myArray.removeAll()
            print("Řádek je hotový ve stacku zbylo: \(stackOfBrackets)\n")
        }
        print("Error score je \(errorScore)")
        
    }
}


struct Stack {
     var myArray: [Character] = []
    
    mutating func push(_ element: Character) {
        myArray.append(element)
    }
    
    mutating func pop() -> Character? {
        return myArray.popLast()
    }
    
    func peek() -> Character? {
        guard let topElement = myArray.last else {return nil}
        return topElement
    }
}
