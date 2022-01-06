//
//  day05.swift
//  AoC2021
//
//  Created by Marcel Mravec on 23.12.2021.
//

import Foundation

enum Day05 {
    static func run() {
        let input = readFile("day05.test")
        let mapSize = 10
        var mapa = Array(repeating: Array(repeating: 0, count: mapSize), count: mapSize)
        //MapParser.parse(input, map: mapa)
        let lines = input.lines
        
        for line in lines {
            if line.isEmpty {
                continue
            }
            print("Řádek je ", line)
            let parts = line.split(separator: " ")
            let souradnice1String = parts[0].split(separator: ",").compactMap(Int.init)
            let souradnice2String = parts[2].split(separator: ",").compactMap(Int.init)
            
            let x1 = souradnice1String[0]
            let y1 = souradnice1String[1]
            let x2 = souradnice2String[0]
            let y2 = souradnice2String[1]
            print("x1 je \(x1), y1 je \(y1), x2 je \(x2) a y2 je \(y2)")
            if x1 == x2 {
                if (y1 < y2) {
                    for i in y1...y2 {
                        mapa[x1][i] += 1
                    }
                } else  {
                        for j in y2...y1 {
                            mapa[x1][j] += 1
                        }
                }
            
            } // endif
            if y1 == y2 {
                if (x1 < x2) {
                    for i in x1...x2 {
                        mapa[i][y1] += 1
                    }
                } else  {
                        for j in x2...x1 {
                            mapa[j][y1] += 1
                        }
                }
            
            } // endif
            
            // je třeba pořešit, když je fce rostoucí
            
            
            
            // tady řeším, když je klesající, ale není to jisté
            
            if x1+x2 == y1+y2 {
                if (x1 < x2) {
                    var i = x1
                    var j = y1
                    while i < x2 {
                        mapa[i][j] += 1
                        i += 1
                        j -= 1
                    }
                } else  {
                    var i = x2
                    var j = y2
                    while i < x1 {
                        mapa[i][j] += 1
                        i += 1
                        j -= 1
                    }
                }
            }
            
            /*print("Tisknu mapu:\n")
            //print(mapa)
            for row in 0..<mapSize {
                print(mapa[row])
            }
                print("\n")
             */
        } // end for
        
        var answer = 0
        for i in 0..<mapSize {
            for j in 0..<mapSize {
                if mapa[i][j] > 1 {
                    answer += 1
                }
            }
        }
        print("Odpověď na část první je \(answer)")
        
    }
}

/*
struct Mapa {
    let rows: Int, columns: Int
    var grid: [Int]
    init(rows: Int, columns: Int) {
        self.rows = rows
        self.columns = columns
        grid = Array(repeating: 0, count: rows * columns)
    }
    func indexIsValid(row: Int, column: Int) -> Bool {
        return row >= 0 && row < rows && column >= 0 && column < columns
    }
    subscript(row: Int, column: Int) -> Int {
        get {
                assert(indexIsValid(row: row, column: column), "Index out of range")
                return grid[(row * columns) + column]
            }
        set {
                assert(indexIsValid(row: row, column: column), "Index out of range")
                grid[(row * columns) + column] = newValue
            }
    }
}


struct MapParser {
    static func parse(_ input: String, map: [[Int]] {
        var lines = input.lines
        
        for line in lines {
            if line.isEmpty {
                continue
            }
            print("Řádek je ", line)
            let parts = line.split(separator: " ")
            let souradnice1String = parts[0].split(separator: ",").compactMap(Int.init)
            let souradnice2String = parts[2].split(separator: ",").compactMap(Int.init)
            
            let x1 = souradnice1String[0]
            let y1 = souradnice1String[1]
            let x2 = souradnice2String[0]
            let y2 = souradnice2String[1]
            print("x1 je \(x1), y1 je \(y1), x2 je \(x2) a y2 je \(y2)")
            if x1 == x2 {
                if y1 < y2 {
                    for i in y1...y2 {
                        map.grid(x1 * i) += 1
                    } else do {
                        for j in y2...y1 {
                            mapa[x1,j] += 1
                    }
                }
            }
            }
        }
        
}
    

 */
