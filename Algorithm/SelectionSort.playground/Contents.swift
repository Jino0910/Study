import UIKit

func solution(array: [Int]) -> [Int] {
    
    var input = input
    
    for i in 0..<input.count-1 {
        var minimumIndex: Int = i
        
        for j in i+1..<input.count {
            if input[j] < input[minimumIndex] {
                minimumIndex = j
            }
        }
        input.swapAt(i, minimumIndex)
    }
    
    return input
}

let array = [13, 5, 11, 7, 23, 15]

print(solution(array: array))
// [5, 7, 11, 13, 15, 23]
