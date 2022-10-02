import UIKit

var greeting = "Hello, playground"

/*
 최대 공약수
 Greatest Common Divisor
 */


let a = "()()()"
let b = "(())()"
let c = ")()("
let d = "(()(("
let e = "(())()"
let f = "()()())(()"
let g = "()((())(()"

func checkQueue(_ aString: String) -> Bool {
    guard aString.first != ")" && aString.last != "(" else { return false }
    guard aString.filter({ $0 == "(" }).count == aString.count/2 else { return false }       
    var leftCount = 0
    var rightCount = 0
    for i in aString {
        if i == "(" {
            leftCount += 1
        } else {
            if leftCount > 0 {
                rightCount += 1
            } else {
                return false
            }
        }
    }
    return true
}

func gcd(_ a: Int, _ b: Int) -> Int {
    return b == 0 ? a: gcd(b, a%b)
}

print(gcd(12, 9))
print(gcd(9, 12))
let A = [1,4,2]
let B = [5,4,4]

let aList = A.sorted(by: >)
let bList = B.sorted(by: <)
let total = zip(aList, bList).map { $0 * $1 }.reduce(0, +)
print(total)

func getGreatestCommonDivisor(_ m: Int, _ n: Int) -> Int {
    var a = 0
    var b = max(m, n)
    var r = min(m, n)
    while r != 0 {
        print(a,b,r)
        a = b
        b = r
        r = a % b
    }
    return b
}

print(getGreatestCommonDivisor(12, 9))
/*
 최소 공배수
 두 자연수 A, B의 최대 공약수가
 */

func leastCommonMultiple(_ m: Int, _ n: Int) -> Int {
    return m * n / getGreatestCommonDivisor(m, n)
}


