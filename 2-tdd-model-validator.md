# TDD - Implementing Model Validator

Introduction 

### TDD 방식으로 회원가입 검증기 만들기

![#mv-intro](./imgs/tdd-model-validator/mv-intro.png)
* 회원가입 폼은 firstname, lastname, email, password, repeat password로 구성되어있다
* 이 폼을 테스트를 먼저 작성한 뒤 실제 코드를 작성하는 방식으로 구현해볼 것이다.

---

Test that user first name is valid

우선 SignupFormModelValidatorTests 파일을 생성한다

```swift
import XCTest

class SignupFormModelValidatorTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
}
```
* 생성한 뒤 testExample과 성능측정 메서드를 제거하고 위 코드만을 남긴다

```swift
import XCTest

class SignupFormModelValidatorTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testSignupFormModelValidator_WhenValidFirstNameProvided_ShouldReturnTrue() {
        
        // Arrange
        let sut = SignupFormModelValidator()
        
        // Act
        
        // Assert
    }
}
```
* 첫 번째 유닛 테스트로 회원가입 폼 검증기에 first name이 입력되었을 때 true를 리턴하는지 검증하는 테스트를 만든다
* 당연히 회원가입 폼 검증기의 구현체인 SignupFormModelValidator이 필요하므로 sut(system under test)로 선언한다
* 하지만 아직 SignupFormModelValidator은 구현되어있지 않으므로 에러가 발생할 것이다
* 이제 SignupFormModelValidator을 만들어주자

```swift
import Foundation

class SignupFormModelValidator {
    
}
```
* 이렇게 SignupFormModelValidator을 생성한 뒤 다시 테스트 함수로 돌아가보자
* 앱코드에 작성된 SignupFormModelValidator을 인식하지 못하고 있기 때문에 아직 에러가 사라지지 않았을 것이다

```swift
import XCTest
@testable import PhotoApp // 추가

class SignupFormModelValidatorTests: XCTestCase {
    // (...)
}
```
* @testable import PhotoApp을 추가하면 앱에 작성된 코드를 사용할 수 있게 만들어주면 에러가 사라지게 된다

```swift
import XCTest
@testable import PhotoApp

class SignupFormModelValidatorTests: XCTestCase {
    // (...)

    func testSignupFormModelValidator_WhenValidFirstNameProvided_ShouldReturnTrue() {
        
        // Arrange
        let sut = SignupFormModelValidator()
        
        // Act
        sut.isFirstNameValid(firstname: "Eonsu")
        
        // Assert
    }
}
```
* 이제 first name부터 검증하기 위해 함수를 호출한다
* 하지만 아직 함수가 정의되어 있지 않기 떄문에 에러가 발생할 것이다
* 실제로 SignupFormModelValidator에 isFirstNameValid 메서드를 작성해서 에러를 없애보자

```swift
class SignupFormModelValidator {
    
    func isFirstNameValid(firstname: String) -> Bool {
        var returnValue = true
        
        if firstname.isEmpty {
            returnValue = false
        }
        
        return returnValue
    }
}
```
* firstname이라는 문자열값을 받아 빈문자열인지 체크한 뒤 불리언값을 반환하는 함수를 작성했다

```swift
class SignupFormModelValidatorTests: XCTestCase {
    // (...)

    func testSignupFormModelValidator_WhenValidFirstNameProvided_ShouldReturnTrue() {
        
        // Arrange
        let sut = SignupFormModelValidator()
        
        // Act
        let isFirstNameValid = sut.isFirstNameValid(firstname: "Eonsu")
        
        // Assert
        XCTAssertTrue(isFirstNameValid, "The isFirstNameValid() should have returned TRUE for a valid first name but returned FALSE")
    }
}
```
* 실제로 완성한 함수를 호출한 값을 변수로 저장한 뒤, 참인지 검증하는 테스트 메서드를 호출한다
* 이렇게 first name을 검증하는 테스트 함수가 완성됐다. 실제로 테스트를 돌려보면 성공하는 것을 확인할 수 있을 것이다
* 성공했다면 firstname 인자를 빈문자열로 바꿔서 실패하는지 다시 테스트를 돌려보자.