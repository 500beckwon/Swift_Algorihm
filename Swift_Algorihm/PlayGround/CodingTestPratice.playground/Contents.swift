import UIKit

var textCase1 = "try hello world"
var textCase2 = " try   hello    world"
func solution(_ s:String) -> String {
    let replaceText = s.replacingOccurrences(of: " ", with: " _")
    let text = replaceText.split(separator: "_")
        .map { String($0) }
        .map { text -> [String] in
            text
                .enumerated()
                .map {
                    ($0%2 == 0 || $0 == 0) ? $1.uppercased() : $1.lowercased()
                }
        }
        .map { $0.reduce("", +) }
        .reduce("", +)
    return text
}

print(solution(textCase1))
print(solution(textCase2))
