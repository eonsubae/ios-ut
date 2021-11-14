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

---

Test for a very short First Name

이번엔 first name의 길이가 2 이상인지를 테스트해보자

```swift
class SignupFormModelValidatorTests: XCTestCase {
    // (...)
    
    func testSignupFormModelValidator_WhenTooShortFirstNameProvided_ShouldReturnFalse() {
        
        // Arrange
        let sut = SignupFormModelValidator()
        
        // Act
        let isFirstNameValid = sut.isFirstNameValid(firstname: "S")
        
        // Assert
        XCTAssertFalse(isFirstNameValid, "The isFirstNameValid() should have returned FALSE for a first name that is shorter than 2 characters but it has returned TRUE")
    }
}
```
* first name을 길이가 1인 문자열로 보내고 False를 리턴하기를 기대하는 테스트 함수를 호출한다
* 테스트를 돌려보면 isFirstNameValid 메서드에 first name의 길이를 체크하는 로직이 없기 때문에 실패할 것이다
* 이제 문자열의 길이를 체크하는 로직을 추가해주자

```swift
class SignupFormModelValidator {
    
    func isFirstNameValid(firstname: String) -> Bool {
        var returnValue = true
        
        if firstname.count < 2 {
            returnValue = false
        }
        
        return returnValue
    }
}
```
* 위와 같이 코드를 수정하면 빈문자열이거나, 길이가 1인 문자열일 때를 함께 걸러낼 수 있다
* 이제 다시 테스트를 돌려보면 통과하는 것을 확인할 수 있을 것이다

테스트 코드에서 사용되는 공통 변수를 setUp으로 옮기기
* 지금까지 작성한 두 테스트 메서드 모두 SignupFormModelValidator을 생성하고 있다
* 코드의 중복을 없애기 위해 이 코드를 setUp으로 옮겨주자

```swift
import XCTest
@testable import PhotoApp

class SignupFormModelValidatorTests: XCTestCase {

    var sut: SignupFormModelValidator!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        sut = SignupFormModelValidator()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
    }

    func testSignupFormModelValidator_WhenValidFirstNameProvided_ShouldReturnTrue() {
        
        // Arrange
        
        // Act
        let isFirstNameValid = sut.isFirstNameValid(firstname: "Eonsu")
        
        // Assert
        XCTAssertTrue(isFirstNameValid, "The isFirstNameValid() should have returned TRUE for a valid first name but returned FALSE")
    }
    
    func testSignupFormModelValidator_WhenTooShortFirstNameProvided_ShouldReturnFalse() {
        
        // Arrange
        
        // Act
        let isFirstNameValid = sut.isFirstNameValid(firstname: "S")
        
        // Assert
        XCTAssertFalse(isFirstNameValid, "The isFirstNameValid() should have returned FALSE for a first name that is shorter than 2 characters but it has returned TRUE")
    }
}
```
* tearDown에서 공통변수를 nil로 만들어 리소스 낭비를 줄이는 작업도 잊지말자

---

Test for a very long First Name

first name이 10자 보다 긴 경우를 테스트해보자

```swift
class SignupFormModelValidatorTests: XCTestCase {
    // (...)
    
    func testSignupFormModelValidator_WhenTooLongFirstNameProvided_ShouldReturnFalse() {
        
        // Arrange
        
        // Act
        let isFirstNameValid = sut.isFirstNameValid(firstname: "abcdefghijkfqef")
        
        // Assert
        XCTAssertFalse(isFirstNameValid, "The isFirstNameValid() should have returned FALSE for a first name that is longer than 10 characters but it has returned TRUE")
    }
}
```
* 위와 같이 작성하고 테스트를 실행해보면 실패할 것이다
* 이제 실제 메서드에서 길이가 10보다 길 때 false를 리턴하도록 수정하자

```swift
class SignupFormModelValidator {
    
    func isFirstNameValid(firstname: String) -> Bool {
        var returnValue = true
        
        if firstname.count < 2 || firstname.count > 10 {
            returnValue = false
        }
        
        return returnValue
    }
}
```
* 위와 같이 수정하고 다시 테스트를 돌려보면 통과할 것이다

보다 코드를 읽기 쉽도록 리팩토링하기

```swift
struct SignupConstants {
    static let firstNameMinLength = 2
    static let fisrtNameMaxLength = 10
}
```
* 우선 회원가입 조건들을 저장할 구조체를 하나 만들어 최소 길이와 최대 길이 변수를 만든다
* 메서드와 테스트 코드에 이 변수들을 반영해주자

```swift
class SignupFormModelValidator {
    
    func isFirstNameValid(firstname: String) -> Bool {
        var returnValue = true
        
        if firstname.count < SignupConstants.firstNameMinLength || firstname.count > SignupConstants.fisrtNameMaxLength {
            returnValue = false
        }
        
        return returnValue
    }
}
```
* 2, 10으로 하드코딩 되어있을 때보다 어떤 조건을 검증하려는 것인지를 보다 쉽게 파악할 수 있게 되었다

```swift
class SignupFormModelValidatorTests: XCTestCase {
    // (...)
    
    func testSignupFormModelValidator_WhenTooShortFirstNameProvided_ShouldReturnFalse() {
        
        // Arrange
        
        // Act
        let isFirstNameValid = sut.isFirstNameValid(firstname: "S")
        
        // Assert
        XCTAssertFalse(isFirstNameValid, "The isFirstNameValid() should have returned FALSE for a first name that is shorter than \(SignupConstants.firstNameMinLength) characters but it has returned TRUE")
    }
    
    func testSignupFormModelValidator_WhenTooLongFirstNameProvided_ShouldReturnFalse() {
        
        // Arrange
        
        // Act
        let isFirstNameValid = sut.isFirstNameValid(firstname: "abcdefghijkfqef")
        
        // Assert
        XCTAssertFalse(isFirstNameValid, "The isFirstNameValid() should have returned FALSE for a first name that is longer than \(SignupConstants.fisrtNameMaxLength) characters but it has returned TRUE")
    }
}
```
* 게다가 최소, 최대 길이의 변경이 있을 때 테스트 코드와 메서드 코드 모두 SignupConstants에서 한 번만 변경하면 두 곳을 동시에 관리할 수 있게됐다

---

