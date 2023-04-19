import Foundation
import XCTest
@testable import Additive

final class NumberTests: XCTestCase {

    func testToSizeString() {
        // Given
        let value = 1024
        // When
        let result = value.toSizeString
        // Then
        XCTAssertEqual(result, "1.0 KB")
    }

    func testDate() {
        // Given
        let value = UInt(1681314000000)
        // When
        let result = value.date
        // Then
        XCTAssertEqual(result.getDate(), "2023-04-12")
        XCTAssertEqual(result.getTime(), "7:10 PM")
    }
}
