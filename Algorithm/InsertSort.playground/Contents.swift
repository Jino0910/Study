import UIKit

func solution(_ array: [Int]) -> [Int] {
    
    var array = array
    
    for i in 0..<array.count {
        for j in (1..<i+1).reversed() {
            if array[j-1] > array[j] {
                array.swapAt(j-1, j)
            }
        }
    }
    
    return array
}

var array = [11, 7, 5, 6, 10, 9]

print(solution(array))
// [5, 6, 7, 9, 10, 11]
