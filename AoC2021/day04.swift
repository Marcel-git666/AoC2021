//
//  day04.swift
//  AoC2021
//
//  Created by Marcel Mravec on 20.12.2021.
//

import Foundation

enum Day04 {
    static func run() {
        let input = readFile("day04.input")
        var game = BingoGameParser.parse(input)
        print("Numbers:", game.numbers)
        print("Boards:")
        for board in game.boards {
            print(board.debugDescription)
        }
        
        game.run()
    }
}


struct BingoCell {
    let value: Int
    let isMarked: Bool
    
    init(_ value: Int, isMarked: Bool = false) {
        self.value = value
        self.isMarked = isMarked
    }
    func marked() -> Self {
        .init(value, isMarked: true)
    }
    
    var debugDescription: String {
        "\(String(format: "%2d", value))\(isMarked ? "*" : " ")"
    }
    
}

struct BingoBoard {
    let cells: [BingoCell]
    let size: Int
    var isFinished: Bool = false
    
    init(numbers: [Int], boardSize: Int) {
        cells = numbers.map { BingoCell($0) }
        assert(cells.count == boardSize * boardSize)
        size = boardSize
    }
    
    private init(cells: [BingoCell], size: Int) {
        self.cells = cells
        self.size = size
        
    }
    
    
    var debugDescription: String {
        var s = ""
        for row in 0..<size {
            for col in 0..<size {
                let i = index(row, col)
                s += cells[i].debugDescription
                s += " "
        }
            s += "\n"
        }
        s += "\n"
        return s
    }
    
    var isWinner: Bool {
        for row in 0..<size {
            if (0..<size).map { cells[index(row, $0)] }.allSatisfy(\.isMarked) {
                return true
            }
        }
        for col in 0..<size {
            if (0..<size).map { cells[index($0, col)] }.allSatisfy(\.isMarked) {
                return true
            }
        }
        return false
    }
    func evaluating(_ number: Int) -> Self {
        .init(cells: cells.map { c in
            BingoCell(c.value, isMarked: c.isMarked || c.value == number) }, size: size )
    }
    private func index(_ row: Int, _ col: Int) -> Int {
        let validRange = 0..<size
        assert(validRange ~= row && validRange ~= col)
        return row * size + col
    }
    
}

struct BingoGame {
    let numbers: [Int]
    var boards: [BingoBoard]
    
    struct WinInfo {
        let board: BingoBoard
        let winningNumber: Int
    }
    
    mutating func run() {
        var wins: [WinInfo] = []
    
        for number in numbers {
            print("We drew number: \(number)")
            for (index, board)  in boards.enumerated() {
                if board.isFinished {
                    continue
                }
                var newBoard = board.evaluating(number)
                
                if newBoard.isWinner {
                    wins.append(.init(board: newBoard, winningNumber: number))
                    print("🎈 we have a winner! 🎉")
                    newBoard.isFinished = true
                    //let sum = newBoard.cells
                    //   .filter {!$0.isMarked}
                    //    .map(\.value)
                    //   .reduce(0,+)
                    //print("Unmarked sum is \(sum)")
                    //print("Answer of part1 is \(sum * number)")
                    
                }
                boards[index] = newBoard
                print(newBoard.debugDescription)
                
                
            }
        }
        if let lastWin = wins.last {
            let sum = lastWin.board.cells
                .filter {!$0.isMarked}
                .map(\.value)
                .reduce(0,+)
            print("Unmarked sum is \(sum)")
            print("Answer of part1 is \(sum * lastWin.winningNumber)")
        }
    }
    
    
}


struct BingoGameParser {
    static func parse(_ input: String) -> BingoGame {
        var lines = input.lines
        let numbers = lines.removeFirst().split(separator: ",").compactMap(Int.init)
        let boardSize = 5
        var boards: [BingoBoard] = []
        var boardLines: [String] = []
        
        for line in lines {
            if line.isEmpty {
                continue
            }
            boardLines.append(line)
            if boardLines.count == boardSize {
                let boardNumbers = boardLines.flatMap {
                    $0.split(separator: " ").compactMap(Int.init)
                }
                let board = BingoBoard(numbers: boardNumbers, boardSize: boardSize)
                boards.append(board)
                boardLines = []
            }
        }
        return BingoGame(numbers: numbers, boards: boards)
    }
    
}
