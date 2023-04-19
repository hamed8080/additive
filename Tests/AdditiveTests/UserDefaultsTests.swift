import Foundation
import XCTest
@testable import Additive

final class UserDefaultsTests: XCTestCase {
    func testSetValueCodable_whenValidDataIsStored_saved() {
        // Given
        let value = User(name: "John", age: 35, retired: true, father: "James")
        // When
        UserDefaults.standard.setValue(codable: value, forKey: "USER")
        // Then
        let result: User = UserDefaults.standard.codableValue(forKey: "USER")!
        XCTAssertEqual(result.age, 35)
        XCTAssertEqual(result.name, "John")
        XCTAssertEqual(result.father, "James")
        XCTAssertEqual(result.retired, true)
    }

    func testSetValueCodable_whenISNotValidDataIsStored_returnNilCodable() {
        // Given
        let value = "TEST"
        // When
        UserDefaults.standard.setValue(codable: value, forKey: "USER")
        // Then
        let result: User? = UserDefaults.standard.codableValue(forKey: "USER")
        XCTAssertNil(result)
    }
}
