import UIKit


/*
버블 정렬 Bubble Sort
두 인접한 데이터를 비교한다
앞에 있는 데이터가 뒤에 있는 데이터보다 크면 둘의 자리를 바꿔준다
한 번의 스캔으로 정렬리 안 되면 배열 전체가 정렬 될 때까지 스캔을 반복한다
인접 데이터끼리 swap 하는 작업은 총 (탐색하는 요소의 갯수 -1)만큼 진행하면 종료된다
 
 */
var bubbleArray = [1, 5, 7, 3, 19, 16, 2, 4]

func bubbleSort(_ array: inout [Int]) {
    for index1 in 0..<(array.count - 1) {
        var isSwap = false
        for index2 in 0..<((array.count - index1) - 1) {
            if array[index2] > array[index2 + 1] {
                array.swapAt(index2, index2+1)
                isSwap = true
            }
        }
        if isSwap == false { return }
    }
}

print(bubbleArray)
bubbleSort(&bubbleArray)
print(bubbleArray)

/*
 선택 정렬 Selection Sort
 데이터 중 가장 작은 값을 찾는다
 찾은 값을 데이터 맨 앞과 교체한다
 맨 앞 데이터를 제외하고 위 과정을 반복한다
 */

var selectArray = [6,3,5,7,9,10,2]

func selectionSort(_ array: inout [Int]) {
    for i in 0..<(array.count - 1) {
        var minIndex = i
        for index in (i + 1)..<array.count {
            if array[index] < array[minIndex] {
                minIndex = index
            }
        }
        array.swapAt(i, minIndex)
    }
}

print(selectArray)
selectionSort(&selectArray)
print(selectArray)

/*
 삽입 정렬
 정렬은 두 번째 요소부터 시작한다
 기준이 되는 index와 인접한 index부터 비교하며 삽입한다
 삽입이 끝나면, 기준 index의 다음 index를 기준으로 잡는다
 */

var insertArray1 = [5,3,8,1,2]

func insertionSort1(_ array: inout [Int]) {
    for i in 1..<array.count {
        for j in stride(from: i, to: 0, by: -1) {
            if array[j] < array[j - 1] {
                array.swapAt(j, j - 1)
            } else {
                break
            }
        }
    }
}

var insertArray2 = [9,8,7,6,5,4,3,2,1]

func insertionSort2(_ array: inout [Int]) {
    for i in 0..<array.count {
        var minNumber = array[i]
        var location = i
        for j in (i+1)..<array.count {
            if minNumber > array[j] {
                minNumber = array[j]
                location = j
            }
        }
        if i != location {
            array.swapAt(i, location)
        }
    }
}


print(insertArray1)
insertionSort1(&insertArray1)
print(insertArray1)

print(insertArray2)
insertionSort2(&insertArray2)
print(insertArray2)


/*
 퀵 정렬
 
 퀵 정렬은 분할 정복이란 알고리즘 기법에 속한다
 문제를 나눌 수 없을 때까지 나누어서 풀고,
 나누어서 푼 문제를 다시 합병하여 답을 얻는 알고리즘
 하양식 접근법으로, 일반적으로 재귀 함수로 구현
 퀵 정렬은 배열을 나눌 수 없을 때까지 나누어서 정렬 후 합병 하는 것이고, 재귀함수로 작성한다
 
 기준점(pivot)을 정해서, 기준점보다 작은 데이터는 왼쪽(left), 큰 데이터는 오른쪽(right)으로 모음
 위에서 모은 왼쪽(left), 오른쪽(right)의 갯수가 1개 이하가 될 때까지 위 작업을 재귀로 반복함
 재귀 함수는 왼쪽(left) + 기준점(pivot) + 오른쪽(right) 을 리턴함
 */

func quickSort(_ array: [Int]) -> [Int] {
    guard let first = array.first, array.count > 1 else { return array }
    let pivot = first
    let left = array.filter { $0 < pivot }
    let right = array.filter { $0 > pivot }
    return quickSort(left) + [pivot] + quickSort(right)
}

var quickArray = [3,67, 5, 34, 4, 1, 9]

print(quickSort(quickArray))

/*
 합병 정렬
 분할 정복 알고리즘 중 하나 퀵 정렬과 마찬가지로 재귀 함수를 이용한다
 배열을 절반으로 잘라, 두 배열로 나눔(배열의 갯수가 7같이 홀수일 경우, 3개&4개로 나눔)
 배열의 갯수가 1개 이하일 때까지 위 작업을 재귀함수로 반복함
 재귀 함수는 나눠진 두 배열을 합병 정렬을 이용해 정렬하고 리턴함
 퀵 정렬과 시간복잡도가 같고(O(n log n)
 버블, 선택, 삽입 성능이 더 좋다

 */


func mergeSort(_ array: [Int]) -> [Int] {
    if array.count <= 1 { return array }
    let center = array.count / 2
    let left = Array(array[0..<center])
    let right = Array(array[center..<array.count])
    
    func merge(_ left: [Int],_ right: [Int]) -> [Int] {
        var left = left
        var right = right
        var result: [Int] = []
        
        while !left.isEmpty && !right.isEmpty {
            if left[0] < right[0] {
                result.append(left.removeFirst())
            } else {
                result.append(right.removeFirst())
            }
        }
        
        // 왼쪽 배열의 요소가 남은 경우
        if !left.isEmpty {
            result.append(contentsOf: left)
        }
        
        // 오른쪽 배열의 요소가 남은 경우
        if !right.isEmpty {
            result.append(contentsOf: right)
        }
        
        return result
    }
    
    return merge(mergeSort(left), mergeSort(right))
}
