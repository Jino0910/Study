import UIKit

func solution(array: [Int]) -> [Int] {
    
    var array = array
    
    for i in 0..<array.count-1 {
        var minimumIndex: Int = i
        
        for j in i+1..<array.count {
            if array[j] < array[minimumIndex] {
                minimumIndex = j
            }
        }
        array.swapAt(i, minimumIndex)
    }
    
    return array
}

let array = [13, 5, 11, 7, 23, 15]

print(solution(array: array))
// [5, 7, 11, 13, 15, 23]
