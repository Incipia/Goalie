//
//  NSDate+Extensions.swift
//  Goalie
//
//  Created by Gregory Klein on 1/2/16.
//  Copyright © 2016 Incipia. All rights reserved.
//

import Foundation

struct DateFormatter
{
   static fileprivate var sharedInstance = DateFormatter()
   
   static var formatter: Foundation.DateFormatter {
      return sharedInstance.formatter
   }
   
   fileprivate lazy var formatter: Foundation.DateFormatter = {
      let df = Foundation.DateFormatter()
      return df
   }()
}

extension Date
{
   var hour: Int {
   return (Calendar.autoupdatingCurrent as NSCalendar).components((.hour), from: self).hour!
   }
   
   var minute: Int {
      return (Calendar.autoupdatingCurrent as NSCalendar).components((.minute), from: self).minute!
   }
   
   var day: Int {
      return (Calendar.autoupdatingCurrent as NSCalendar).components((.day), from: self).day!
   }
   
   var month: Int {
      return (Calendar.autoupdatingCurrent as NSCalendar).components((.month), from: self).month!
   }
   
   func dateHalfwayBetweenDate(_ date: Date) -> Date
   {
      let difference = max(timeIntervalSince1970, date.timeIntervalSince1970) - min(timeIntervalSince1970, date.timeIntervalSince1970)
      let newTimeInterval = max(timeIntervalSince1970, date.timeIntervalSince1970) - (difference * 0.5)
      return Date(timeIntervalSince1970: newTimeInterval)
   }
   
   func logHourAndMinute()
   {
      print("hour: \(self.hour) minute: \(self.minute)")
   }
   
   func prettyDateString() -> String
   {
      let formatter = DateFormatter.formatter
      formatter.dateStyle = Foundation.DateFormatter.Style.long
      formatter.timeStyle = .medium
      
      return formatter.string(from: self)
   }
   
   func dayString() -> String
   {
      let formatter = DateFormatter.formatter
      formatter.dateFormat = "EEEE"
      return formatter.string(from: self)
   }
}

func <(l: Date, r: Date) -> Bool {
   return l.compare(r) == .orderedAscending
}

func >(l: Date, r: Date) -> Bool {
   return l.compare(r) == .orderedDescending
}

func ==(l: Date, r: Date) -> Bool {
   return l.compare(r) == .orderedSame
}

func <=(l: Date, r: Date) -> Bool {
   let result = l.compare(r)
   return result == .orderedAscending || result == .orderedSame
}

func >=(l: Date, r: Date) -> Bool {
   let result = l.compare(r)
   return result == .orderedDescending || result == .orderedSame
}
