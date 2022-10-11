import UIKit

/*
 재귀 함수
 자기 자신의 함수 안에서 원하는 결과값을 얻기까지 자신의 함수를 호출하는 형태
 시간 복잡도 O(n)
 */

//Factorial

func fatorial(_ num: Int) -> Int {
    var result = 1
    for n in 2...num {
        result *= n
    }
    return result
}

// 재귀로 Fatorial 계산

func fatorialRecursive(_ num: Int) -> Int {
    if num <= 1 {
        return 1
    }
    return (num * fatorialRecursive(num - 1))
}

print(fatorialRecursive(10))


/*피보나치
 F(n) = F(n -1) + F(n - 2)
 */


var numbers = 2
var before = 1
var beforebefore = 0
var beforeCopy = 1
 
func solution(_ n:Int) -> Int {
    return fibo(before, beforebefore, n)
}
 
func fibo(_ b: Int,_ bb: Int,_ n: Int) -> Int {
    beforeCopy = b
    before = (bb + b)%1234567
    beforebefore = beforeCopy
    
    numbers += 1
    
    if numbers < n {
        return fibo(before, beforebefore, n)
    }else{
        return (before + beforebefore)%1234567
    }
}
