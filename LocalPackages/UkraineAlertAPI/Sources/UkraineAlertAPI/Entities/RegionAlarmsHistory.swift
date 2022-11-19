// Generated by Create API
// https://github.com/CreateAPI/CreateAPI
//
// swiftlint:disable all

import Foundation

public struct RegionAlarmsHistory: Codable {
    public var regionID: String?
    public var regionName: String?
    public var alarms: [RegionAlarmModel]?

    public init(regionID: String? = nil, regionName: String? = nil, alarms: [RegionAlarmModel]? = nil) {
        self.regionID = regionID
        self.regionName = regionName
        self.alarms = alarms
    }

    private enum CodingKeys: String, CodingKey {
        case regionID = "regionId"
        case regionName
        case alarms
    }
}
