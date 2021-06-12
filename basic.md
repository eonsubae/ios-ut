# Basics of Unit Testing in Xcode

유닛 테스트란
* 코드의 특정 부분을 테스트하기 위해 작성된 매우 작은 함수

```swift
func isEmailValid(email: String) -> Bool {
  // A function in the app needs to be tested
}
```
* 이메일 유효성을 검증하는 함수가 있다고 가정하자
* 이 하나의 함수에 대해서만 여러 테스트를 작성할 수 있다
* 이메일 데이터를 인자로 보내고 있다
  - 여러 데이터 타입으로 테스트
  - 같은 데이터 타입이지만 내부 로직상 invalid한 인자로 테스트
* 결과가 의도한 Bool값이 나오는지 테스트

주의점
* 위와 같이 하나의 함수에 여러 테스트를 작성하는 것이 일반적이다
* 유닛 테스트를 여러 함수에 적용하려고 해서는 안된다
  - 유닛 테스트는 동시에 하나의 함수에만 적용해야 한다

Xcode Test Framework
* Xcode는 테스트를 위한 기능을 제공해준다
* 작성된 테스트가 의도한대로 동작하는지 체크는 물론 성능까지 테스트해준다
* 통과한 테스트는 녹색으로, 통과하지 못한 테스트는 빨간색으로 표시된다

테스트 함수 예제
```swift
struct SignupFormModel {
  let firstName: String
  let lastName: String
  let email: String
  let password: String
  let repeatPassword: String
}

extension SignupFormModel {
  func isValidEmailFormat() -> Bool {
    return email.contains("@") && email.contains(".")
  }
}
```

```swift
func testSignUpFormModel_WhenCreated_EmailShouldHaveValidFormat() {
  // Arrange
  let email = "test@test.com"
  let signupFormModel = SignupFormModel(firstName: firstName, lastName: lastName, email: email, password: password, repeatPassword: repeatPassword)

  // Act
  let isEmailFormatValid = signupFormModel.isValidEmailFormat()

  // Assert
  XCTAssertTrue(isEmailFormatValid, "Provided valid email address does not have a valid format")
}
```

------

Testing Pyramid
* iOS 테스트에는 크게 세 종류의 테스트가 있다

Unit Test
* 매우 작은 단위의 테스트로 코드의 특정 부분만 테스트한다 
* 데이터 베이스, 네트워크 통신 같은 외부 의존성이 없다
* 대신 Fake database나 Mock을 활용한다

Integration Test
* Fake database나 Mock이 아닌 실제 데이터베이스 혹은 네트워크 통신을 하면서 테스트한다

UI Test
* UI Interaction이나 Behavior를 자동화해서 테스트한다

------

F.I.R.S.T Principle
* 유닛 테스트에서 자주 사용되는 원칙이다

Fast
* 유닛 테스트는 Fake database나 Mock 같은 외부 의존성 없이 빠르게 테스트하는 것을 추구한다
* 코드의 일부분만 테스트하고 외부와 통신이 없으므로 속도가 빠르다

Independent
* 유닛 테스트 끼리는 서로 의존성을 가지지 않는다
* 유닛 테스트는 랜덤으로 실행될 수 있어야 한다

Repeatable
* 유닛 테스트는 여러 번 호출하든, 다른 컴퓨터(환경)에서 테스트하든 동일한 결과를 내야 한다
* 이 원칙을 지키려면 특정 환경이나 다른 유닛테스트에 종속된 테스트를 만들지 않아야 한다

Self-validating
* 테스트가 완료되고 나면, 테스트가 통과되든 통과되지 않든, 개발자가 추가적인체크 작업을 할 필요가 없어야 한다
* 유닛 테스트 자체만으로 성공인지 실패인지 판단할 수 있어야 한다

Thorough & Timely
* Thorough(철저함) : 엣지 케이스를 커버할 수 있는 테스트를 작성해야 한다
  - valid한 파라미터, invalid한 파라미터를 보냈을 때 의도한 대로 동작해야 한다
  - minimum, maximum 등 문제가 발생할 수 있을만한 상황을 최대한 배제하도록 테스트해야 한다
* Timely : 피쳐를 만드는 동안 테스팅을 수시로 해야 한다
  - 반복적으로 테스트가 성공하는 것을 확인하면서 개발중인 피쳐가 제대로 동작할지 도움을 얻을 수 있다

------

Test Driven Development
* 개발 프로세스를 구조화 하는 방법들 중 하나로, 코드를 먼저 작성하고 테스팅 하는 것이 아니라 테스트를 먼저 작성한 뒤 테스트를 통과하는 코드를 작성한다

TDD의 네 가지 스텝
* Red
  - 실패하는 테스트를 작성한다
  - 코드를 먼저 작성하기 전에 유닛 테스트를 작성하기 위해 거치는 절차다
  - 테스트가 실패하면 빨간색이 나오므로 Red라고 한다
* Green
  - 앞서 만들었던 실패하는 테스트를 통과시키는 절차다
  - 테스트가 성공하면 녹색이 나오므로 Green이라고 한다
* Refactor
  - 유닛 테스트 코드와 앱 코드 양쪽 모두 더 깔끔한 코드로 만드는 절차다
* Repeat
  - 위 단계를 모든 피쳐가 개발되고 테스트될 때까지 반복한다

------

