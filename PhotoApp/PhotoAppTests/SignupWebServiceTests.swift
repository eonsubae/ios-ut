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
        let signupFormRequestModel = SignupFormRequestModel(firstName: "Eonsu", lastName: "Bae", email: "bes@gmail.com", password: "qejwqpwexzjcas1!")
        
        // Act
        sut.signup(withForm: signupFormRequestModel)
        
        // Assert
    }
}
