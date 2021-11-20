# TDD. Implementing Network Service Class

Intro
* 네트워크 통신을 하는 서비스 객체의 유닛 테스트를 작성해볼 것이다
* 유닛 테스트는 통합 테스트와 달리 실제 네트워크 통신을 하지 않는다
* 그 대신 목 객체로 대체용 응답결과를 제공할 것이다. 
* 실제로 어떻게 프로토콜을 활용해 목을 생성하는지 알아보자

![#tdd-network-intro](./imgs/tdd-impl-networking/tdd-network-intro.png)
* URLProtocol을 모킹해서 서비스 메서드가 실제로 네트워크 통신을 하지 않고 요청, 응답 성공 실패에 따른 테스트를 가능하게 만들어볼 것이다

---

Create Initial SignupWebServiceTests Unit Test class

SignupWebService 클래스 작성하기
* SignupWebService는 유저 정보들을 보내서 회원가입하는 클래스다
* 실제 구현에는 특정 엔드포인트에 대한 HTTP Request, Response handling이 포함된다
* TDD 방식으로 우선 테스트 클래스를 생성한 뒤 실제 객체를 완성해보자

```swift
import XCTest

class SignupWebServiceTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
}
```

---

