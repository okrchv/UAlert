// Generated by Create API
// https://github.com/CreateAPI/CreateAPI
//
// swiftlint:disable all

import Foundation

public struct TimeSpan: Codable {
    public var ticks: Int?
    public var days: Int?
    public var hours: Int?
    public var milliseconds: Int?
    public var minutes: Int?
    public var seconds: Int?
    public var totalDays: Double?
    public var totalHours: Double?
    public var totalMilliseconds: Double?
    public var totalMinutes: Double?
    public var totalSeconds: Double?

    public init(ticks: Int? = nil, days: Int? = nil, hours: Int? = nil, milliseconds: Int? = nil, minutes: Int? = nil, seconds: Int? = nil, totalDays: Double? = nil, totalHours: Double? = nil, totalMilliseconds: Double? = nil, totalMinutes: Double? = nil, totalSeconds: Double? = nil) {
        self.ticks = ticks
        self.days = days
        self.hours = hours
        self.milliseconds = milliseconds
        self.minutes = minutes
        self.seconds = seconds
        self.totalDays = totalDays
        self.totalHours = totalHours
        self.totalMilliseconds = totalMilliseconds
        self.totalMinutes = totalMinutes
        self.totalSeconds = totalSeconds
    }
}