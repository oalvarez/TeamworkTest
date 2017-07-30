//
//  Date.swift
//  TeamworkTest
//
//  Created by Oscar Alvarez on 30/7/17.
//  Copyright © 2017 Oscar Alvarez. All rights reserved.
//

import Foundation

extension Date {
  
  static func from(string: String) -> Date? {
    if string.isEmpty { return nil }
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
    if dateFormatter.date(from: string) == nil {
      dateFormatter.dateFormat = "yyyyMMdd"
    }
    return dateFormatter.date(from:string)
  }
  
  func display() -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateStyle = .medium
    dateFormatter.timeStyle = .none
    return dateFormatter.string(from: self)
  }
  
  func getStringIntervalSinceReference() -> String {
    return String(self.timeIntervalSinceReferenceDate)
  }
  
}
