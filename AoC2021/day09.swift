//
//  day09.swift
//  AoC2021
//
//  Created by Marcel Mravec on 29.12.2021.
//

import Foundation

enum Day09 {
    static func run() {
        
        let input = readFile("day09.input")
        print(input)
        let values = input.lines.map { line in
            line.compactMap {Int(String($0)) }
        }
        let map = HeightMap(values: values)

        let risk = map.lowPointsRisk()
        print("Risk je \(risk)")
        let sum = risk.reduce(0, +)
        print("Sum of low points is \(sum)")
        
    }
    
}

struct HeightMap {
    let values: [[Int]]
    
    struct Coordinate: Hashable {
        let row: Int
        let col: Int
    }
    
    func lowPoints() -> [Int] {
        var lowPoints: [Int] = []
        var knownHighPointIndices: Set<Coordinate> = []
        
        
        
        for row in 0..<values.count {
            for col in 0..<values[row].count {
                let coord = Coordinate(row: row, col: col)
                
                if knownHighPointIndices.contains(coord) {
                    continue
                }
                let neighbours = neighbours(for: coord)
                let neigborHeights = neighbours.map {
                    (coord: $0, height: height(at: $0))
                }
                let thisHeight = height(at: coord)
                if neigborHeights.allSatisfy({ $0.height > thisHeight }) {
                    lowPoints.append(thisHeight)
                    knownHighPointIndices.formUnion(neighbours)
                }
                    
            }
        }
        return lowPoints
    }
    
    func lowPointsRisk() -> [Int] {
        lowPoints() .map { $0 + 1}
    }
    
    func height(at coordinate: Coordinate) -> Int {
        values[coordinate.row][coordinate.col]
    }
    
    func neighbours(for c: Coordinate) -> Set<Coordinate> {
        guard !values.isEmpty else { return []}
        var neighbours: Set<Coordinate> = []
        
        if c.row > 0 {
            neighbours.insert(.init(row: c.row - 1, col: c.col))
        }
        if c.col > 0 {
            neighbours.insert(.init(row: c.row, col: c.col - 1))
        }
        if c.row < values.count - 1 {
            neighbours.insert(.init(row: c.row + 1, col: c.col))
        }
        if c.col < values[0].count - 1 {
            neighbours.insert(.init(row: c.row, col: c.col + 1))
        }
        return neighbours
    }
    
}
