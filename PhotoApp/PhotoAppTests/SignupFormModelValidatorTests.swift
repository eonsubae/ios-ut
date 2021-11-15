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
        XCTAssertFalse(isFirstNameValid, "The isFirstNameValid() should have returned FALSE for a first name that is shorter than \(SignupConstants.firstNameMinLength) characters but it has returned TRUE")
    }
    
    func testSignupFormModelValidator_WhenTooLongFirstNameProvided_ShouldReturnFalse() {
        
        // Arrange
        
        // Act
        let isFirstNameValid = sut.isFirstNameValid(firstname: "abcdefghijkfqef")
        
        // Assert
        XCTAssertFalse(isFirstNameValid, "The isFirstNameValid() should have returned FALSE for a first name that is longer than \(SignupConstants.firstNameMaxLength) characters but it has returned TRUE")
    }
    
    func testSignupFormModelValidator_WhenValidLastNameProvided_ShouldReturnTrue() {
        
        // Arrange
        
        // Act
        let isLastNameValid = sut.isLastNameValid(lastname: "Bae")
        
        // Assert
        XCTAssertTrue(isLastNameValid, "The isLastNameValid() should have returned TRUE for a valid last name but returned FALSE")
    }
    
    func testSignupFormModelValidator_WhenTooShortLastNameProvided_ShouldReturnFalse() {
        
        // Arrange
        
        // Act
        let isLastNameValid = sut.isLastNameValid(lastname: "B")
        
        // Assert
        XCTAssertFalse(isLastNameValid, "The isLastNameValid() should have returned FALSE for a last name that is shorter than \(SignupConstants.lastNameMinLength) characters but it has returned TRUE")
    }
    
    func testSignupFormModelValidator_WhenTooLongLastNameProvided_ShouldReturnFalse() {
        
        // Arrange
        
        // Act
        let isLastNameValid = sut.isLastNameValid(lastname: "BaeBaeBaeBaeBae")
        
        // Assert
        XCTAssertFalse(isLastNameValid, "The isLastNameValid() should have returned FALSE for a last name that is longer than \(SignupConstants.lastNameMaxLength) characters but it has returned TRUE")
    }
    
    func testSignupFormModelValidator_WhenValidEmailProvided_ShouldReturnTrue() {
        
        // Arrange
        
        // Act
        let isEmailValid = sut.isEmailValid(address: "eonsubae@gmail.com")
        
        // Assert
        XCTAssertTrue(isEmailValid, "The isEmailValid() should have returned TRUE for a valid email address but returned FALSE")
    }
    
    func testSignupFormModelValidator_WhenValidPasswordProvided_ShouldReturnTrue() {
        
        // Arrange
        
        // Act
        let isPasswordValid = sut.isPasswordValid(password: "f!0qipefjeqwpqwe")
        
        // Assert
        XCTAssertTrue(isPasswordValid, "The isPasswordValid() should have returned TRUE for a valid password but returned FALSE")
    }
    
    func testSignupFormModelValidator_WhenTooShortPasswordProvided_ShouldReturnFalse() {
        
        // Arrange
        
        // Act
        let isPasswordValid = sut.isPasswordValid(password: "f!0")
        
        // Assert
        XCTAssertFalse(isPasswordValid, "The isPasswordValid() should have returned FALSE for a password that is shorter than \(SignupConstants.passwordMinLength) characters but it has returned TRUE")
    }
    
    func testSignupFormModelValidator_WhenTooLongPasswordProvided_ShouldReturnFalse() {
        
        // Arrange
        
        // Act
        let isPasswordValid = sut.isPasswordValid(password: "f!0qerwrerqerqwrqwerqwerqwr0qerwrerqerqwrqwerqwerqwr")
        
        // Assert
        XCTAssertFalse(isPasswordValid, "The isPasswordValid() should have returned FALSE for a password that is longer than \(SignupConstants.passwordMaxLength) characters but it has returned TRUE")
    }
    
    func testSignupFormModelValidator_WhenEqualPasswordsProvided_ShouldReturnTrue() {
        
        // Arrange
        
        // Act
        let doPasswordsMatch = sut.doPasswordsMatch(password: "djfpqq0!", repeatPassword: "djfpqq0!")
        
        // Assert
        XCTAssertTrue(doPasswordsMatch, "The doPasswordsMatch() should have returned TRUE for matching passwords but it has returned FALSE")
    }
}
