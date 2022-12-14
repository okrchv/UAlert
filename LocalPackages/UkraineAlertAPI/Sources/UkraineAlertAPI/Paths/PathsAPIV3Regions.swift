// Generated by Create API
// https://github.com/CreateAPI/CreateAPI
//
// swiftlint:disable all

import Foundation
import Get
import URLQueryEncoder

extension Paths {
    public static var regions: Regions {
        Regions(path: "/api/v3/regions")
    }

    public struct Regions {
        /// Path: `/api/v3/regions`
        public let path: String

        /// Повертає список усіх областей, регіонів та міст
        public var get: Request<RegionsViewModel> {
            .get(path)
        }
    }
}
