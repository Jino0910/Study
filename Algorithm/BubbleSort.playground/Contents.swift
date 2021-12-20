import UIKit

func solution(_ array: [Int]) -> [Int] {
    
    var array = array
    
    for i in 0..<array.count-1 {
        for j in 0..<array.count-(i+1) {
            if array[j] > array[j+1] {
                array.swapAt(j, j+1)
            }
            print(array)
        }
    }
    
    
    return array
}

let array = [13, 5, 11, 7, 23, 15]

print(solution(array))
