import XCTest

class OrderTest: XCTestCase {

    override func setUp() {
        print("setUp")
    }
    
    override func tearDown() {
        print("tearDown")
    }

    func skip_testA() {
        print("Running Test A")
    }

    func testB() {
        print("Running Test B")
    }
    
    func testC() {
        print("Running Test C")
    }
    
    func testD() {
        print("Running Test D")
    }
}
