import Foundation
import XCTest


final class DateTests: XCTestCase {

    func testGetTime() {
        // Given
        let value = Date(timeIntervalSince1970: 1681314000000)
        // When
        let result = value.getTime()
        // Then
        XCTAssertEqual(result, "10:10 PM")
    }

    func testGetDate() {
        // Given
        let value = UInt(1681314000000)
        // When
        let result = value.date.getDate()
        // Then
        XCTAssertEqual(result, "2023-04-12")
    }

    //LEFT=====CENTER====RIGHT
    func testIsBetween_WhenDateIsBetweenTowOtherDate_returnTrue() {
        // Given
        let now = Date()
        let left = Calendar.current.date(byAdding: .day, value: 1, to: now)!
        let center = Calendar.current.date(byAdding: .day, value: 5, to: now)!
        let right = Calendar.current.date(byAdding: .day, value: 10, to: now)!
        // When
        let result = center.isBetweeen(date: left, andDate: right)
        // Then
        XCTAssertTrue(result)
    }

    func testIsBetween_WhenDateIsNotBetweenTowOtherDate_returnTrue() {
        // Given
        let now = Date()
        let left = Calendar.current.date(byAdding: .day, value: 8, to: now)!
        let center = Calendar.current.date(byAdding: .day, value: 5, to: now)!
        let right = Calendar.current.date(byAdding: .day, value: 10, to: now)!
        // When
        let result = center.isBetweeen(date: left, andDate: right)
        // Then
        XCTAssertFalse(result)
    }

    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    func testTimeAgoCondense() {
        // Given
        let date = Date(timeIntervalSince1970: 1681314000000)
        // When
        let result = date.timeAgoSinceDateCondense
        // Then
        XCTAssertEqual(result, "Sep 19, 48")
    }

    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    func testTimeAgoCondense_whenDateIsToday_returnHourAndMinuteOnly() {
        // Given
        let date = Date()
        // When
        let result = date.timeAgoSinceDateCondense!
        // Then
        XCTAssertFalse(result.contains(","))
        XCTAssertTrue(result.contains(":"))
        XCTAssertTrue(result.contains("AM") || result.contains("PM"))
    }

    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    func testTimeAgoCondense_whenDateIsInsideTheCurrentMonth_returnWeekDayHourAndMinuteOnly() {
        // Given
        let calendar = Calendar(identifier: .gregorian)
        let startOfTheWeek = Calendar.current.dateComponents([.calendar, .yearForWeekOfYear, .weekOfYear], from: Date()).date!
        let oneDayLaterInTheSameWeek = calendar.date(byAdding: .day, value: 1, to: startOfTheWeek)!
        // When
        let result = oneDayLaterInTheSameWeek.timeAgoSinceDateCondense!
        // Then
        XCTAssertTrue(result.contains(" "), "There should be a space between Day name and time")
        XCTAssertTrue(result.contains(":"))
        XCTAssertFalse(result.contains("AM") || result.contains("PM"))
    }

    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    func testTimeAgoCondense_whenDateIsInsideTheCurrentYear_returnWeekDayHourAndMinuteOnly() {
        // Given
        let calendar = Calendar(identifier: .gregorian)
        let startOfTheYear = Calendar.current.dateComponents([.calendar, .year], from: Date()).date!
        let oneDayLaterInTheSameYear = calendar.date(byAdding: .day, value: 1, to: startOfTheYear)!
        // When
        let result = oneDayLaterInTheSameYear.timeAgoSinceDateCondense!
        // Then
        XCTAssertEqual(result.split(separator: " ").count , 4, "There should be 4 spacees between Month, Day and Time and `at`")
        XCTAssertTrue(result.contains(":"))
        XCTAssertFalse(result.contains("AM") || result.contains("PM"))
    }

    func testMillisecondsSince1970() {
        // Given
        let value = Date(timeIntervalSince1970: 1681314000000)
        // When
        let result = value.millisecondsSince1970
        // Then
        XCTAssertEqual(result, 1681314000000 * 1000, accuracy: 0)
    }

    func testInitMillisecons() {
        // Given
        let value = Date(milliseconds: 1681314000000)
        // When
        let result = value.timeIntervalSince1970
        // Then
        XCTAssertEqual(result, 1681314000000 / 1000, accuracy: 0)
    }

    func testTimerString() {
        // Given
        let value = Calendar.current.date(byAdding: .minute, value: -5, to: .init())!
        // When
        let result = value.timerString
        // Then
        XCTAssertEqual(result?.count, 8)
    }
}
