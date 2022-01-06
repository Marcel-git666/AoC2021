import Algorithms
import Foundation


struct Stack {
    private var myArray: [Character] = []
    
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





var stack = Stack()
stack.peek()
stack.push("(")
stack.push("{")
stack.push("<")
print(stack)
stack.peek()
stack.pop()
stack.pop()
stack.pop()
stack.peek()
stack.pop()
