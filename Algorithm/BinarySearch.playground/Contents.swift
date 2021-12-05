import UIKit

func binarySearch(_ array: [Int], _ value: Int) -> Int? {
    
    guard !array.isEmpty else { return nil }
    
    var left = 0
    var right = array.count - 1
    
    while left <= right {
        
        let middleIndex = (left + right) / 2
        let middleValue = array[middleIndex]
        
        if middleValue > value {
            right = middleIndex - 1
        } else if middleValue < value {
            left = middleIndex + 1
        } else {
            return middleIndex
        }
    }
    return nil
}

var array = [1, 3, 4, 5, 12, 13, 22, 31, 72]

let foundIndex = binarySearch(array, 12)
print(foundIndex ?? -1)
