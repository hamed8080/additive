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
        XCTAssertEqual(result, "1.0 KB", "Expected the string to be equal to '1.0 KB' but it's \(String(describing: result))")
    }

    func testDate() {
        // Given
        let value = UInt(1681314000000)
        // When
        let result = value.date

        // Then
        let resultDate = result.getDate()
        let resultTime = result.getTime()
        XCTAssertEqual(resultDate, "2023-04-12", "Expected the string to be equal to '2023-04-12' but it's \(String(describing: resultDate))")
        XCTAssertEqual(resultTime, "7:10 PM", "Expected the string to be equal to '7:10 PM' but it's \(String(describing: resultTime))")
    }
}
