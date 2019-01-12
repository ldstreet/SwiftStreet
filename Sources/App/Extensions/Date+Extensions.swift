//
//  Date+Extensions.swift
//  App
//
//  Created by Luke Street on 7/11/18.
//

import Foundation

extension Date {
    public static func dateFrom_MMddyyyy(_ dateStr: String) -> Date? {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM/dd/yyyy"
        return formatter.date(from: dateStr)
    }
}
