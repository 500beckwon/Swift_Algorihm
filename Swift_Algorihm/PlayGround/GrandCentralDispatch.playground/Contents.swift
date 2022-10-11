import UIKit

/*
 GCD

 Swift에서 스레드 관련 작업은 Grand Central Dispatch API를 통해 처리하는데 여기서
 GCD는 클로저 블록 안에 있는 특정 작업을 큐에 올리고, 해당 큐를 특정 스레드에 실행하는 방식이다
 멀티 코어와 멀티 프로세싱 환경에서 스레드 프로그래밍을 효율적으로 할 수 있도록 애플이 개발한 기술로 적절하게 사용하여
 Thread-safe하게 구현하는 것이 중요하다.
 
 Dispatch Queue에 작업을 추가하면 GCD는 작업에 맞는 스레드를 자동으로 생성해서 실행하고, 작업이 종료되면
 스레드를 제거한다.
 
 async (비동기) : DispatchQueue로 task를 보낸 후, (Queue에서 그 일을 처리하든말든 신경 쓰지 않고) 나는 남아있는
 내 할일을 한다
 
 ★ sync (동기) : DispatchQueue로 task를 보낸 후, Queue에서 그 일을 끝내면 남아있는 일을 한다
 
 SerialQueue.sync

 : 메인 스레드의 작업 흐름이 queue에 넘긴 태스크가 끝날때까지 멈춰있고(sync), 넘겨진 task는 queue에 먼저 담겨있던 작업들과 같은 스레드에 보내지기 때문에 해당 작업들이 모두 끝나야 실행 (Serial Queue)

 ConcurrentQueue.sync

 : 메인 스레드의 작업 흐름이 queue에 넘긴 태스크가 끝날때까지 멈춰있고(sync), 넘겨진 task는 queue에 먼저 담겨있던 작업들과 다른 스레드에 보내질 수 있기 때문에 해당 작업들이 모두 끝나지 않아도 실행 (Concurrent Queue)

 SerialQueue.async

 : 메인 스레드의 작업 흐름이 태스크를 queue에 넘기자마자 반환되고 (async), 넘겨진 task는 queue에 먼저 담겨있던 작업들과 같은 스레드에 보내지기 때문에 해당 작업들이 모두 끝나야 실행 (Serial Queue)

 ConcurrentQueue.async

 : 메인 스레드의 작업 흐름이 태스크를 queue에 넘기자마자 반환되고 (async), 넘겨진 task는 queue에 먼저 담겨있던 작업들과 다른 스레드에 보내질 수 있기 때문에 해당 작업들이 모두 끝나지 않아도 실행 (Concurrent Queue)
 */

/*
 Operation

 Operation에서 사용하는 queue의 이름은 Operation Queue.
 얘도 내부적으론 GCD 위에서 동작한다. 다만 좀 더 기능들이 추가된 형태.

 동시에 실행할 수 있는 동작의 최대 수 지정
 동작 일시 중지 및 취소
 */

/*
 Queue
 queue는 새로운 아이템을 뒤에 추가할 수 있고, 앞에 아이템을 제거가 가능한 리스트이다. 그래서 처음 넣은(enqueue)
 아이템을 처음 제거(dequeue)할 수 있다. FIFO(First in - First Out)형태이다
 
 큐는 FIFO(First In First Out)의 특성을 가지는 자료구조로
 가장 먼저 넣은 데이터를 가장 먼저 꺼내는 특징을 가진다
 
 Serial
 이전 작업이 끝나면 다음 작업을 순차적으로 실행하는 "직렬"형태의 Queue
 
 Concurrent
 이전 작업이 끝날 때 까지 기다리는 것이 아닌, 병렬 형태로 동시에 !!! 실행되는 Queue 입니다
 */


/*
 RunLoop 객체는 소켓, 파일, 키보드 마우스 등의 입력 소스를 처리하는 이벤트 처리 루프로,
 쓰레드가 일해야 할 때는 일하고, 일이 없으면 쉬도록 하는 목적으로 고안되었다
 RunLoop 입장에서 Timer는 입력이 아닌 특수한 유형이지만, Timer의 이벤트 또한 처리한다
 */

DispatchQueue.global().async {
    for i in 1...5 {
        print(i, "DispatchQueue.global().async2" )
    }
}
 
DispatchQueue.global().async {
    for i in 200...205 {
       print(i, "DispatchQueue.global().async2")
    }
}
 
 
 
for i in 100...105 {
    print(i,"i")
}

func forLoop(_ workName: String){
    var result = 0
    for _ in 1...10{
        result += 1
    }
    print("[\(workName)] : \(result)")
}

//var runLooop = RunLoop.current

DispatchQueue.global().async {
    forLoop("global 1")
}
DispatchQueue.global().async {
    forLoop("global 2")
}
DispatchQueue.global().async {
    forLoop("global 3")
}
DispatchQueue.global().async {
    forLoop("global 4")
}

//runLooop.run()

