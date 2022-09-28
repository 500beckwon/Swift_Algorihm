import UIKit

var greeting = "Hello, playground"
/*
 
버블 정렬 Selection Sort
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

bubbleSort(&bubbleArray)
print(bubbleArray)

/*
 선택 정렬 Selection Sort
 데이터 중 가장 작은 값을 찾는다
 찾은 값을 데이터 맨 앞과 교체한다
 맨 앞 데이터를 제외하고 위 과정을 반복한다
 */
