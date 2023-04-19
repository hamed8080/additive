import Foundation
import XCTest


final class DataTests: XCTestCase {

    func testUtf8String() {
        // Given
        let data = "TEST".data(using: .utf8)
        // When
        let result = data?.utf8String
        // Then
        XCTAssertEqual(result, "TEST")
    }

    func testUtf8StringOrEmpty_whenHasValue_returnString() {
        // Given
        let data: Data? = "TEST".data(using: .utf8)
        // When
        let result = data?.utf8StringOrEmpty
        // Then
        XCTAssertEqual(result, "TEST")
    }

    func testUtf8StringOrEmpty_whenIsEmpty_returnEmpty() {
        // Given
        let data: Data? = "".data(using: .utf8)
        // When
        let result = data?.utf8StringOrEmpty
        // Then
        XCTAssertEqual(result, "")
    }

    func testImageScale_whenImageIsValid_returnReducedVersion() throws {
        // Given
        let url = Bundle.module.url(forResource: "icon", withExtension: "png")!
        let data = try Data(contentsOf: url)
        // When
        let result = data.imageScale(width: 128)
        // Then
        XCTAssertEqual(result?.0.width, 128)
    }

    func testImageScale_whenImageIsNotValid_returnNil() {
        // Given
        let data = "TEST".data!
        // When
        let result = data.imageScale(width: 128)
        // Then
        XCTAssertNil(result)
    }
}
