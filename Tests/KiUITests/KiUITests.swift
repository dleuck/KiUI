import XCTest
@testable import KiUI
@testable import KiCore

final class KiUITests: XCTestCase {
    
    func testBlendToWhite() throws {
        »RGB.red.blend(RGB.white)
        XCTAssertEqual(RGB.red.blend(RGB.white), RGB(1, 0.5, 0.5))
        
        »RGB.red.blend(RGB.white, percent:0.75)
        XCTAssertEqual(RGB.red.blend(RGB.white, percent:0.75), RGB(1, 0.75, 0.75))
    }
    
    func testBlendToWhiteFromDarkRed() throws {
        »RGB.red.blend(RGB.white)
        XCTAssertEqual(RGB(0.5, 0, 0).blend(RGB.white), RGB(0.75, 0.5, 0.5))
        
        // »RGB.red.blend(RGB.white, percent:0.75)
        // XCTAssertEqual(RGB.red.blend(RGB.white, percent:0.75), RGB(1, 0.75, 0.75))
    }
    
    func testBlendToBlack() throws {
        »RGB.red.blend(RGB.black)
        XCTAssertEqual(RGB.red.blend(RGB.black), RGB(0.5, 0, 0))
        
        »RGB.red.blend(RGB.black, percent:0.75)
        XCTAssertEqual(RGB.red.blend(RGB.black, percent:0.75), RGB(0.25, 0, 0))
    }
    
    func testIncreateLightness() throws {
        XCTAssertEqual(RGB(0.5, 0, 0).lightness(0), RGB(0.5, 0, 0))
        XCTAssertEqual(RGB(0.5, 0, 0).lightness(0.5), RGB(0.75, 0.5, 0.5))
        XCTAssertEqual(RGB(0.5, 0, 0).lightness(0.75), RGB(0.875, 0.75, 0.75))
    }
    
    func testDecreaseLightness() throws {
        XCTAssertEqual(RGB(0.5, 0, 0).lightness(-0.5), RGB(0.25, 0, 0))
        XCTAssertEqual(RGB(0.5, 0, 0).lightness(-0.75), RGB(0.125, 0, 0))
    }
    
    func testBetween() {
        XCTAssertEqual(RGB.between(4, 0), 2)
        XCTAssertEqual(RGB.between(4, 0, percent: 0.25), 3)
        XCTAssertEqual(RGB.between(4, 0, percent: 0.75), 1)
        XCTAssertEqual(RGB.between(4, 8), 6)
        XCTAssertEqual(RGB.between(4, 8, percent: 0.25), 5)
        XCTAssertEqual(RGB.between(4, 8, percent: 0.75), 7)
    }
}
