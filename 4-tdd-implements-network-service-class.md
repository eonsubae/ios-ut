# TDD. Implementing Network Service Class

Intro
* 네트워크 통신을 하는 서비스 객체의 유닛 테스트를 작성해볼 것이다
* 유닛 테스트는 통합 테스트와 달리 실제 네트워크 통신을 하지 않는다
* 그 대신 목 객체로 대체용 응답결과를 제공할 것이다. 
* 실제로 어떻게 프로토콜을 활용해 목을 생성하는지 알아보자

![#tdd-network-intro](./imgs/tdd-impl-networking/tdd-network-intro.png)
* URLProtocol을 모킹해서 서비스 메서드가 실제로 네트워크 통신을 하지 않고 요청, 응답 성공 실패에 따른 테스트를 가능하게 만들어볼 것이다

---