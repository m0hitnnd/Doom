//
//  ScreenTimeReportView.swift
//  Doom
//
//  Created by Mohitnnd on 4/1/25.
//
import SwiftUI
import DeviceActivity
import FamilyControls
import ManagedSettings

extension DeviceActivityReport.Context {
    static let barGraph = Self("barGraph")
    static let pieChart = Self("pieChart")
    static let totalActivity = Self("Total Activity")
}

struct ScreenTimeReportView: View {
    // These could be populated with real tokens as needed.
    let selectedApps: Set<ApplicationToken>
    let selectedCategories: Set<ActivityCategoryToken>
    let selectedWebDomains: Set<WebDomainToken>
    
    // The report’s visual context (bar graph or pie chart)
    @State private var context: DeviceActivityReport.Context = .totalActivity
    
    // Filter configuration with an initial segment interval (daily during the current week)
    @State private var filter = DeviceActivityFilter(
        segment: .daily(
            during: Calendar.current.dateInterval(of: .weekOfYear, for: Date())!
        ),
        users: .all, // or .individual if appropriate
        devices: .init([.iPhone, .iPad]),
        applications: [],
        categories: [],
        webDomains: []
    )
    
    public var body: some View {
        VStack(spacing: 20) {
//            Text("Screen Time Report")
//                .font(.largeTitle)
//                .padding(.top)
//            
            // Display the system-provided DeviceActivityReport view
            DeviceActivityReport(context, filter: filter)
                .frame(width: 300, height: 300)
                .background(content: { Color.gray.opacity(0.2) })
                .padding()
//            
//            // Picker to change the report context (visual style)
//            Picker("Report Context", selection: $context) {
//                Text("Bar Graph")
//                    .tag(DeviceActivityReport.Context.barGraph)
//                Text("Pie Chart")
//                    .tag(DeviceActivityReport.Context.pieChart)
//            }
//            .pickerStyle(SegmentedPickerStyle())
//            .padding([.leading, .trailing])
//            
//            // Picker to change the filter's segment interval
//            Picker("Segment Interval", selection: $filter.segmentInterval) {
//                Text("Hourly")
//                    .tag(DeviceActivityFilter.SegmentInterval.hourly())
//                Text("Daily")
//                    .tag(DeviceActivityFilter.SegmentInterval.daily(
//                        during: Calendar.current.dateInterval(of: .weekOfYear, for: Date())!
//                    ))
//                Text("Weekly")
//                    .tag(DeviceActivityFilter.SegmentInterval.weekly(
//                        during: Calendar.current.dateInterval(of: .month, for: Date())!
//                    ))
//            }
//            .pickerStyle(SegmentedPickerStyle())
//            .padding([.leading, .trailing])
//            
//            // Optional: Display counts of selected tokens
//            Text("Selected Apps: \(selectedApps.count)")
//            Text("Selected Categories: \(selectedCategories.count)")
//            Text("Selected Web Domains: \(selectedWebDomains.count)")
            
            Spacer()
        }
    }
}
