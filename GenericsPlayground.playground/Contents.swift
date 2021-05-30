import UIKit

let optionalName = Optional<String>.some("hahahahaha")
if let unwrapName = optionalName {
    //    debugPrint(unwrapName)
}


debugPrint(getEmoji("gato"))

enum EmojiErros: Error {
    case emojiNotFound
    case emojiBanned
}


func getEmoji(_ arg: String) -> Result<String, EmojiErros> {
    
    switch arg {
    case "gato":
        return .success("😸")
    case "dragao":
        return .success("🐉")
    case "vaxco":
        return .failure(.emojiBanned)
        
    default:
        return .failure(.emojiNotFound)
    }
    
}


struct Queue<T> {
    
    private var elements: [T] = []
    
    mutating func enqueue(_ newElement: T) {
        elements.append(newElement)
    }
    
    mutating func dequeue() -> T? {
        guard !elements.isEmpty else { return nil }
        return elements.remove(at: 0)
    }

}

var newQ = Queue<String>()

newQ.enqueue("ssssss")
newQ.enqueue("yy")
newQ.dequeue()
newQ.dequeue()
newQ.dequeue()

func pairs<Key, Value>(from dictionary: [Key: Value]) -> [(Key, Value)] {
  return Array(dictionary)
}

var newPair = pairs(from: ["s1" : 88.0])
let morePairs = pairs(from: [1: "Swift",
                             2: "Generics",
                             3: "Rule"])


func mid<T: Comparable>(array: [T]) -> T? {
  guard !array.isEmpty else { return nil }
    array.sorted()
    [(array.count - 1) / 2]
  return array.sorted()[(array.count - 1) / 2]
}

protocol Summable { static func +(lhs: Self, rhs: Self) -> Self }
extension Int: Summable {}
extension Double: Summable {}

func add<T: Summable>(x: T, y: T) -> T {
  return x + y
}

let x = add(x: 9, y: 10)
let y = add(x: 9.9, y: 4.4)


extension String: Summable {}

let myString = add(x: "Vaxco", y: " da gama")

enum Reward<T> {
    case lucky
    case myOptionWith(T)
    
    var message: String  {
        switch self {
        case .lucky:
            return "Se fufu"
        case .myOptionWith(let arg):
            return "Vc ganhou uma \(arg)"
        }
    }
}


debugPrint(Reward.myOptionWith(Date()).message)
