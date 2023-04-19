import Foundation
import XCTest
@testable import Additive

final class URLTests: XCTestCase {

    let filePath = "file://test/insidefolder/picture.jpg"
    let urlString: String = "http://www.example.com"

    func testAppendQueryItems_whenHasValue_appendedAtEnd() {
        // Given
        let json = ["name": "John"]
        var url = URL(string: urlString)!
        // When
        url.appendQueryItems(with: json)
        // Then
        let expectationResult = "http://www.example.com?name=John"
        XCTAssertEqual(url.absoluteString, expectationResult)
    }

    func testAppendQueryItemsiOS15_whenHasValue_appendedAtEnd() {
        // Given
        let json = ["name": "John"]
        var url = URL(string: urlString)!
        let queryItems = try! url.makeQueryItems(encodable: json)
        // When
        url.appendQueryItems(queryItems!)
        // Then
        let expectationResult = "http://www.example.com?name=John"
        XCTAssertEqual(url.absoluteString, expectationResult)
    }

    func testAppendQueryItems_whenHasNotValue_appendedNothingAtEnd() {
        // Given
        let json = [String: String]()

        var url = URL(string: urlString)!
        // When
        url.appendQueryItems(with: json)
        // Then
        XCTAssertEqual(url.absoluteString, urlString)
    }

    func testAppendQueryItems_whenHasNotValue_appendedNothingAtEndOfCurrentQueryItems() {
        // Given
        let json = [String: String]()
        let urlString: String = "\(urlString)?name=John"
        var url = URL(string: urlString)!
        // When
        url.appendQueryItems(with: json)
        // Then
        XCTAssertEqual(url.absoluteString, urlString)
    }

    func testPathExtension_whenIsValidFileURL_returnValue() {
        // Given
        let url = URL(string: filePath)!
        // When
        let ext = url.fileExtension
        // Then
        let expectationResult = "jpg"
        XCTAssertEqual(ext, expectationResult)
    }
    func testPathExtension_whenIsNotValidFileURL_returnNil() {
        // Given
        let url = URL(string: urlString)!
        // When
        let ext = url.fileExtension
        // Then
        let expectationResult = ""
        XCTAssertEqual(ext, expectationResult)
    }

    func testFileName_whenIsValidFileURL_returnFileName() {
        // Given
        let url = URL(string: filePath)!
        // When
        let fileName = url.fileName
        // Then
        let expectationResult = "picture"
        XCTAssertEqual(fileName, expectationResult)
    }

    func testFileNameWithExtension_whenIsValidFileURL_returnFileNameWithExtension() {
        // Given
        let url = URL(string: filePath)!
        // When
        let result = url.fileNameWirhExtension
        // Then
        let expectationResult = "picture.jpg"
        XCTAssertEqual(result, expectationResult)
    }

    func testFileNameWithExtension_whenIsNotValidFileURL_returnFileNameWithExtensionNil() {
        // Given
        let url = URL(string: urlString)!
        // When
        let result = url.fileNameWirhExtension
        // Then
        XCTAssertNil(result)
    }

    func testImageScale_whenImageIsValid_returnReducedVersion() {
        // Given
        let url = Bundle.module.url(forResource: "icon", withExtension: "png")!
        // When
        let result = url.imageScale(width: 128)
        // Then
        XCTAssertEqual(result?.0.width, 128)
    }

    func testImageScale_whenImageURLIsNotValid_returnNil() {
        // Given
        let url = URL(string: urlString)!
        // When
        let result = url.imageScale(width: 128)
        // Then
        XCTAssertNil(result)
    }

#if canImport(MobileCoreServices)
    func testMimeType_whenIsFile_returnMimeType() {
        // Given
        let url = URL(string: filePath)!
        // When
        let result = url.mimeType
        // Then
        let expectationResult = "image/jpeg"
        XCTAssertEqual(result, expectationResult)
    }

    func testMimeTypeiOS15_whenIsFile_returnMimeType() {
        // Given
        let url = URL(string: filePath)!
        // When
        let result = url.ios15MimeType
        // Then
        let expectationResult = "image/jpeg"
        XCTAssertEqual(result, expectationResult)
    }

    func testMimeTypeiOS14_whenIsFile_returnMimeType() {
        // Given
        let url = URL(string: filePath)!
        // When
        let result = url.ios14MimeType
        // Then
        let expectationResult = "image/jpeg"
        XCTAssertEqual(result, expectationResult)
    }
#endif
}
