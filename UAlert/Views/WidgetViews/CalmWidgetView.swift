//
//  CalmWidgetView.swift
//  UAlert
//
//  Created by Oleh Kiurchev on 25.07.2022.
//

import SwiftUI

struct CalmWidgetView: View {
    let invasionDate = Date(timeIntervalSince1970: 1645678800)

    var lastUpdate: Date?
    var regionName: String?
        
    var body: some View {
        VStack(alignment: .leading) {
            HStack(spacing: 5) {
                Text(LocalizedStringKey("All\ngood"))
                    .font(.system(.caption, design: .rounded))
                    .kerning(1)
                    .fontWeight(.bold)
                    .textCase(.uppercase)
                    .lineLimit(2)
                    .fixedSize()
                    .foregroundColor(.green)
                Spacer()
                ZStack {
                    Image(systemName: "shield.righthalf.filled").foregroundColor(.yellow)
                    Image(systemName: "shield.lefthalf.filled").foregroundColor(.blue)
                }.font(.system(.title))
            }
            Spacer()
            HStack(spacing: 5) {
                if let name = regionName {
                    Text(name.replacingOccurrences(of: "територіальна громада", with: "ТГ"))
                        .fontWeight(.semibold)
                } else {
                    Text(LocalizedStringKey("N/A")).fontWeight(.semibold)
                }
                Image(systemName: "location.fill")
            }
            .font(.system(.caption2))
            Spacer()
            if let date = lastUpdate {
                // We consider all alert end dates before 24.02.2022 as anomalies
                if (date < invasionDate) {
                    Text(LocalizedStringKey("out of data\nabout last alarm"))
                        .font(.system(.headline))
                        .fontWeight(.semibold)
                        .lineLimit(3)
                        .allowsTightening(true)
                        .minimumScaleFactor(0.5)
                // We should display all dates for alerts which ended yesterday and earlier
                // as day count starting with "1 day" if alert was ended yesterday
                } else if (date < Calendar.current.startOfDay(for: Date.now)) {
                    
                    let tomorrowStart = Calendar.current.startOfDay(
                        for: Calendar.current.date(byAdding: .day, value: 1, to: Date.now)!
                    )
                    
                        Text(date..<tomorrowStart, format: .components(style: .wide, fields: [.year, .month, .week, .day]))
                            .font(.system(.largeTitle, design: .rounded))
                            .foregroundColor(.primary)
                            .lineLimit(1)
                            .allowsTightening(true)
                            .minimumScaleFactor(0.5)
                        Text(LocalizedStringKey("without air alarms"))
                            .font(.system(.subheadline))
                            .fontWeight(.semibold)
                            .fixedSize()
                            .allowsTightening(true)
                            .minimumScaleFactor(0.5)
                // If alert was ended today we should display time when this event was happened
                } else {
                    Text(date, format: .dateTime.hour().minute())
                        .font(.system(.title, design: .rounded))
                        .foregroundColor(.primary)
                    Text(LocalizedStringKey("end of the last alarm"))
                        .font(.system(.subheadline))
                        .fontWeight(.semibold)
                        .lineLimit(1)
                        .allowsTightening(true)
                        .minimumScaleFactor(0.5)
                }
            }
        }
        .foregroundColor(.secondary)
        .padding()
    }
}

//struct CalmWidgetView_Previews: PreviewProvider {
//    static var previews: some View {
//        Group {
//            CalmWidgetView(lastDate: Date())
//                .environment(\.locale, .init(identifier: "uk"))
//                .preferredColorScheme(.light)
//                .previewLayout(.fixed(width: 160, height: 160))
//            CalmWidgetView(lastDate: Date())
//                .environment(\.locale, .init(identifier: "uk"))
//                .preferredColorScheme(.dark)
//                .previewLayout(.fixed(width: 160, height: 160))
//        }
//    }
//}
