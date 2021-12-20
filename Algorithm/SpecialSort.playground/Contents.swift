import UIKit

func solution(_ array: [Int]) -> [Int] {
    
    var array = array
    
    for i in 0..<array.count-1 {
        for j in 0..<array.count-(i+1) {
            if array[j] > 0 &&
                array[j+1] < 0 {
                array.swapAt(j, j+1)
            }
        }
    }
    return array
}

let array = [1, 2, 3, -3, -2, 5, 6, -6]

print(solution(array))
// [-3, -2, -6, 1, 2, 3, 5, 6]
