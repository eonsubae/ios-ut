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
}
```

---

Create Initial SignupWebService Class

```swift
import XCTest

class SignupWebServiceTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testSignupWebService_WhenGivenSuccessfulResponse_ReturnsSuccess() {
        // Arrange
        let sut = SignupWebService()
        
        // Act
        
        // Assert
    }
}
```
* 우선 SignupWebService가 회원가입에 성공했다는 응답을 받았을 때를 테스트하는 메서드를 생성해보자
* 테스트 대상인 SignupWebService 인스턴스를 Arrange에 생성하면 클래스가 없기 때문에 에러가 발생할 것이다
* 실제로 SignupWebService 클래스를 만들어주자

```swift
// SignupWebService.swift

import Foundation

class SignupWebService {
    
}

// SignupWebServiceTests.swift

import XCTest
@testable import PhotoApp

class SignupWebServiceTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testSignupWebService_WhenGivenSuccessfulResponse_ReturnsSuccess() {
        // Arrange
        let sut = SignupWebService()
        
        // Act
        
        // Assert
    }
}
```
* 간단한 형식만 갖춘 클래스를 정의해둔다
* 그리고 테스트 파일에는 PhotoApp을 import한다
* 이제 테스트 케이스내의 에러가 사라졌을 것이다

---

Implementing SignupFormRequestModel

```swift
func testSignupWebService_WhenGivenSuccessfulResponse_ReturnsSuccess() {
    // Arrange
    let sut = SignupWebService()
    let signupFormRequestModel = SignupFormRequestModel()
    
    // Act
    sut.signup(withForm: signupFormRequestModel)
    
    // Assert
}
```
* signup 메서드에 회원가입 정보를 담은 요청용 모델인 SignupFormRequestModel의 인스턴스를 넘겨주도록 구현할 것이다
* 실제로 SignupFormRequestModel객체와 signup 메서드를 생성하지 않았기 때문에 에러가 발생할 것이다

```swift
// SignupFormRequestModel.swift
import Foundation

struct SignupFormRequestModel {
    
}


// SignupWebService.swift
import Foundation

class SignupWebService {
    
    func signup(withForm formModel: SignupFormRequestModel) {
        
    }
}
```
* 이제 테스트 케이스의 에러가 사라졌을 것이다

```swift
func testSignupWebService_WhenGivenSuccessfulResponse_ReturnsSuccess() {
    // Arrange
    let sut = SignupWebService()
    let signupFormRequestModel = SignupFormRequestModel(firstName: "Eonsu", lastName: "Bae", email: "bes@gmail.com", password: "qejwqpwexzjcas1!")
    
    // Act
    sut.signup(withForm: signupFormRequestModel)
    
    // Assert
}
```
* 요청 모델에 실제 회원가입 모델처럼 firstname, lastname, email, password를 생성자 파라미터로 넘겨주자
* SignupFormRequestModel의 프로퍼티가 테스트처럼 구현되어있지 않아 에러가 발생할 것이다
* SignupFormRequestModel의 프로퍼티를 구현하자

```swift
import Foundation

struct SignupFormRequestModel: Encodable {
    let firstName: String
    let lastName: String
    let email: String
    let password: String
}
```
* 테스트가 통과하도록 프로퍼티를 입력하고 JSON으로 변환이 가능하게 해주는 Encodable 프로토콜을 상속받게했다
* 테스트를 확인해보면 에러가 사라졌을 것이다

---

Adding CompletionHandler to Signup Method Signature
* 회원가입 요청은 비동기로 이루어진다
* 따라서 요청이 완료된 타이밍에 작업을 수행하려면 컴플리션 핸들러를 넘겨줘야 한다
* 우선 테스트에 클로저를 추가하자

```swift
func testSignupWebService_WhenGivenSuccessfulResponse_ReturnsSuccess() {
    // Arrange
    let sut = SignupWebService()
    let signupFormRequestModel = SignupFormRequestModel(firstName: "Eonsu", lastName: "Bae", email: "bes@gmail.com",password: "qejwqpwexzjcas1!")
    
    // Act
    sut.signup(withForm: signupFormRequestModel) { (signupResponseModel, error) in
        
    }
    
    // Assert
}
```
* signupResponseModel은 회원가입 응답용 구조체로 SignupResponseModel의 인스턴스다
* error는 회원가입이 실패했을 때 받는 열거형으로 된 에러값이며 SignupErrors의 인스턴스다
* 아직 컴플리션 핸들러가 구현되어있지 않아 에러가 발생할 것이다

```swift
import Foundation

class SignupWebService {
    
    func signup(withForm formModel: SignupFormRequestModel, completionHandler: @escaping (SignupResponseModel, SignupErrors?) -> Void) {
        
    }
}
```
* 테스트를 확인해보면 에러가 사라져있을 것이다
* 하지만 아직 SignupResponseModel과 SignupErrors이 구현되어 있지 않아 SignupWebService에는 에러가 발생하고 있다
* 이 객체들을 구현해주자

---

Implementing the initial SignupResponseModel

```swift
import Foundation

struct SignupResponseModel: Decodable {
    
}
```
* SignupResponseModel은 회원가입이 성공했을 때 받게되는 응답 객체다
* JSON, XML 등의 형식으로 반환되는 데이터를 swift에서 사용하기 위해 Decodable 프로토콜을 따르게 해야한다

Implementing the initial SignupErrors Enum

```swift
import Foundation

enum SignupErrors: Error {
    
}
```
* SignupErrors 열거형을 에러로 사용하기 위해 Error 프로토콜을 따르게 해야한다

---