import XCTest
@testable import KiUI
@testable import KiCore

final class KiUITests: XCTestCase {
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        // XCTAssertEqual(KiUI().text, "Hello, World!")
    }
    
    func testBlendToWhite() throws {
        »RGB.red.blend(RGB.white)
        XCTAssertEqual(RGB.red.blend(RGB.white), RGB(1, 0.5, 0.5))
        
        »RGB.red.blend(RGB.white, percent:0.75)
        XCTAssertEqual(RGB.red.blend(RGB.white, percent:0.75), RGB(1, 0.75, 0.75))
    }
    
    func testBlendToBlack() throws {
        »RGB.red.blend(RGB.black)
        XCTAssertEqual(RGB.red.blend(RGB.black), RGB(0.5, 0, 0))
        
        »RGB.red.blend(RGB.black, percent:0.75)
        XCTAssertEqual(RGB.red.blend(RGB.black, percent:0.75), RGB(0.25, 0, 0))
    }
}
