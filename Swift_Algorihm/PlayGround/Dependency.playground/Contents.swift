import UIKit

/*
 의존성이란?
 객체 지향 프로그래밍에서 Dependency, 의존성은 서로 다른 객체 사이에 의존 관계가 있다는 것을 말한다. 즉, 의존하는 객체가
 수정되면, 다른 객체도 영향을 받는다는 것이다.
 */

/*
 의존성 주입
 */

/*
 의존관계 역전법칙
 객체 지향 프로그래밍에서 의존관계 역전 원칙은 소프트웨어 모듈들을 분리하는 특정 형식을 지칭한다. 이 원칙을 따르면,
 상위 계층(정책 결정)이 하위 계층(세부 사항)에 의존하는 전통적인 의존관계를 반전(역전)시킴으로써 상위 계층이 하위 계층의
 구현으로부터 독립되게 할 수 있다. 이 원칙은 다음과 같은 내용을 담고 있다.

 상위 모듈은 하위 모듈에 의존해서는 안된다. 상위 모듈과 하위 모듈 모두 추상화에 의존해야 한다.
 추상화는 세부 사항에 의존해서는 안된다. 세부사항이 추상화에 의존해야 한다.
 이 원칙은 '상위와 하위 객체 모두가 동일한 추상화에 의존해야 한다'는 객체 지향적 설계의 대원칙을 제공한다
 */

protocol NetworkAble {
    associatedtype Response: Decodable
    func request(handler: @escaping((Result<Response, Error>) -> () ))
}

final class Networker<Response: Decodable>: NetworkAble  {
    private let session: URLSession
    private let url: URL
    
    init(session: URLSession, url: URL) {
        self.session = session
        self.url = url
    }
    
    func request(handler: @escaping ((Result<Response, Error>) -> ())) {
        session.dataTask(with: url) { data , reponse, error in
            handler(.success(try! JSONDecoder().decode(Response.self, from: data!)))
        }
    }
}

struct Eat {
    func coffee() {
        print("아메리카노")
    }

    func meal() {
        print("피자")
    }
}

struct Person {
    var todayEat: Eat
    
    func coffee() {
        todayEat.coffee()
    }
    
    func meal() {
        todayEat.meal()
    }
}

var eat = Eat()
var person = Person(todayEat: eat)
eat.coffee()
eat.meal()
person.meal()
person.coffee()

print(person.todayEat)
