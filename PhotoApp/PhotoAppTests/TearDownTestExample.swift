import XCTest

class TearDownTestExample: XCTestCase {
    
    override class func setUp() {
        print("**** Class setUp() method is called") // 1.
    }

    override func setUpWithError() throws {
        print("**** Instance setUpWithError() method is called") // 2.
    }
    
    override class func tearDown() {
        print("**** Class tearDown() method is called") // 6.
    }
    
    override func tearDownWithError() throws {
        print("**** Instance tearDownWithError() method is called") // 5.
    }

    func testExample() throws {
       print("**** Test method is called") // 3.
        addTeardownBlock { // 4.
            // Called when testExample() ends.
            print("**** TeardownBlock is called when test method ends")
        }
    }

    func testUserService_WhenGivenValidRecord_CanSuccessfullyPersistToStorage() throws {
        
        // Arrange
        let userRecord = User(firstname: "Sean", lastName: "Bae")
        
        // Act
        let storedRecord = sut.storeRecord(userRecord)
        
        addTeardownBlock {
            sut.deleteRecord(storedRecord)
        }
        
        // Assert
        XCTAssertNotNil(storedRecord)
    }
}
