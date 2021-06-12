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
