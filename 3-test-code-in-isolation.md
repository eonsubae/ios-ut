# Test code in isolation

테스트와 격리

![#isolation-intro](./imgs/test-code-in-isolation/isolation-intro.png)
* Class A의 function a1를 테스트하는 상황을 가정해보자
* 테스트가 실패하는데 문제는 function a가 의존중인 Class B의 function b1, b2가 실패하고 있기 때문이었다
* 본질적으로 테스트하고 싶었던 대상은 함수 a1인데 함수 a1이 의존중인 다른 객체로부터 영향을 받는 것은 바람직하지 않다
* 이런 상황을 해결하기 위해 격리하는 방법을 알아둘 필요가 있다

---

의존성 주입(Dependency Injection) 

![#di](./imgs/test-code-in-isolation/di.png)
* 일반적으로 객체 A가 객체 B, 객체 C에 의존하는 경우 객체 A안에서 B, C의 인스턴스를 생성해 소유한다
* 의존성 주입은 반대로 외부에서 생성된 객체 B, C를 A가 필요에 따라 주입받는 형태로 구현한다
* 이렇게하면 객체 A와 B, C 사이에 결합도가 줄어들어 보다 테스트하기 쉬운 코드를 작성할 수 있다

![#mock-fake-stub](./imgs/test-code-in-isolation/mock-fake-stub.png)
* 그리고 객체 A의 테스트를 위해서 실제 객체 B와 객체 C를 매번 신경쓰는 것은 불필요하다
* 따라서 mock 혹은 fake 객체와 stub 메서드를 이용해서 테스트를 수행한다
* '격리'란 이렇게 객체 B, C에 영향을 받지 않고 객체 A만 테스트하는 것을 의미한다

예시 

![#implements-di](./imgs/test-code-in-isolation/implements-di.png)
* 테스트하려는 함수에 웹서비스 객체가 필요할 때, 함수 내에서 직접 생성하지 않고 인자로 프로토콜을 이용해서 유연하게 구현해야 한다
* 멤버변수로 특정객체를 소유해야 할 때는 생성자 혹은 프로퍼티에 특정 프로토콜을 따르는 객체를 주입받도록 구현한다

---
