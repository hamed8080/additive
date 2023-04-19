import XCTest
@testable import Additive

final class CodableTests: XCTestCase {

    let user: User = .init(name: "John", age: 32, retired: true, father: nil)
    let array = [["name": "John"], ["name": "Sarah"]]
    let json = "[{\"name\":\"John\"},{\"name\":\"Sarah\"}]"
    let unEncodeable = ["number": Double.infinity]

    func testString_whenDataIsStringable_returnString() {
        XCTAssertEqual(array.string, json)
    }

    func testData_whenDataIsEncodable_isNotNil() {
        XCTAssertNotNil(json.data)
    }

    func testData_whenDataIsNotEncodable_isNil() {
        XCTAssertNil(unEncodeable.data)
    }

    func testString_whenDataIsNotEncodable_isNil() {
        XCTAssertNil(unEncodeable.string)
    }

    func testPrettyStringData_whenStringIsNotPretty_returnPrettyString() {
        // When
        let data = array.dataPrettyPrint
        // Then
        let expectation = "[\n  {\n    \"name\" : \"John\"\n  },\n  {\n    \"name\" : \"Sarah\"\n  }\n]"
        XCTAssertEqual(data?.utf8String, expectation)
    }

    func testParameterData_when_returnData() {
        // When
        let data = user.parameterData
        // Then
        let result = data!.utf8String!
        XCTAssertTrue(result.contains("name=John") && result.contains("age=32") && result.contains("retired=1"))
        if #available(iOS 16.0, *) {
            XCTAssertEqual(result.split(separator: "&").count, 3)
        } else {
            XCTAssertEqual(result.components(separatedBy: "&").count, 3)
        }
    }

    func testParameterData_whenDataISNotEncodable_returnNil() {
        XCTAssertNil(unEncodeable.parameterData)
    }

    func testAsDictionary_when_returnDictionary() throws {
        // When
        let dic = try user.asDictionary()
        // Then
        XCTAssertEqual(dic.count, 3)
    }

    func testAsDictionary_whenISUnencoable_throwAnError() {
        XCTAssertThrowsError(try unEncodeable.asDictionary())
    }

    func testAsDictionary_whenISUnserializableString_throwAnError() {
        XCTAssertThrowsError(try "[name=2]".asDictionary())
    }

    func testAsDictionaryNullable_when_returnDictionary() throws {
        // When
        let dic = try user.asDictionaryNuallable()
        // Then
        XCTAssertEqual(dic.count, 3)
    }

    func testAsDictionaryNullable_whenUnEncodable_returnThrowAnError() {
        XCTAssertThrowsError(try unEncodeable.asDictionaryNuallable())
    }

    func testAsDictionaryNullable_wheniSUnSerializable_returnThrowAnError() {
        XCTAssertThrowsError(try "[name=2]".asDictionaryNuallable())
    }

    func testJsonString_whenEncodeObject_returnJson() throws {
        // When
        let jsonString = user.jsonString
        // Then
        let expectation = "{\"name\":\"John\",\"age\":32,\"retired\":true}"
        XCTAssertEqual(jsonString, expectation)
    }

    func testJsonString_whenUnencodable_returnNil() throws {
        XCTAssertNil(unEncodeable.jsonString)
    }
}

