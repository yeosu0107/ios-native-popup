import XCTest
@testable import NativePopup

final class NativePopupTests: XCTestCase {
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        let printValue = justPrint(message: "Hello, World!")
        XCTAssertEqual(printValue, "justPrint: Hello, World!")
    }
}
