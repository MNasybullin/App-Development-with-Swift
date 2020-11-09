import UIKit

var numbers = [5, 1, 7, 9, 2, 10, 87, -2, 11, 0]

func bubleSort(numbers: [Int]) -> [Int] {
    var i = 1
    var nbr = numbers
    while(i < nbr.count) {
        if nbr[i - 1] > nbr[i] {
            let tmp = nbr[i]
            nbr[i] = nbr[i - 1]
            nbr[i - 1] = tmp
            i = 0
        }
        i += 1
    }
    return nbr
}

var sort = bubleSort(numbers: numbers)
print(numbers)
print(sort)

func binarySearch(numbers: [Int], searchNumber: Int) -> Int? {
    var left = 0
    var right = numbers.count
    var search = -1
    
    while (left <= right) {
        let mid: Int = (left + right) / 2
        if searchNumber == numbers[mid] {
            search = mid
            break
        }
        if searchNumber < numbers[mid] {
            right = mid - 1
        } else {
            left = mid + 1
        }
    }
    if (search == -1) {
        print("Number is Not Found")
        return nil
    } else {
        print("Number is Found!")
        return search
    }
}

var search = binarySearch(numbers: sort, searchNumber: 10)
print(search!)
