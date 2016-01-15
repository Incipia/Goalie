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
   static private var sharedInstance = DateFormatter()
   
   static var formatter: NSDateFormatter {
      return sharedInstance.formatter
   }
   
   private lazy var formatter: NSDateFormatter = {
      let df = NSDateFormatter()
      return df
   }()
}

extension NSDate
{
   var hour: Int {
   return NSCalendar.autoupdatingCurrentCalendar().components((.Hour), fromDate: self).hour
   }
   
   var minute: Int {
      return NSCalendar.autoupdatingCurrentCalendar().components((.Minute), fromDate: self).minute
   }
   
   var day: Int {
      return NSCalendar.autoupdatingCurrentCalendar().components((.Day), fromDate: self).day
   }
   
   var month: Int {
      return NSCalendar.autoupdatingCurrentCalendar().components((.Month), fromDate: self).month
   }
   
   func dateHalfwayBetweenDate(date: NSDate) -> NSDate
   {
      let difference = max(timeIntervalSince1970, date.timeIntervalSince1970) - min(timeIntervalSince1970, date.timeIntervalSince1970)
      let newTimeInterval = max(timeIntervalSince1970, date.timeIntervalSince1970) - (difference * 0.5)
      return NSDate(timeIntervalSince1970: newTimeInterval)
   }
   
   func logHourAndMinute()
   {
      print("hour: \(self.hour) minute: \(self.minute)")
   }
   
   func prettyDateString() -> String
   {
      let formatter = DateFormatter.formatter
      formatter.dateStyle = NSDateFormatterStyle.LongStyle
      formatter.timeStyle = .MediumStyle
      
      return formatter.stringFromDate(self)
   }
   
   func dayString() -> String
   {
      let formatter = DateFormatter.formatter
      formatter.dateFormat = "EEEE"
      return formatter.stringFromDate(self)
   }
}

func <(l: NSDate, r: NSDate) -> Bool {
   return l.compare(r) == .OrderedAscending
}

func >(l: NSDate, r: NSDate) -> Bool {
   return l.compare(r) == .OrderedDescending
}

func ==(l: NSDate, r: NSDate) -> Bool {
   return l.compare(r) == .OrderedSame
}

func <=(l: NSDate, r: NSDate) -> Bool {
   let result = l.compare(r)
   return result == .OrderedAscending || result == .OrderedSame
}

func >=(l: NSDate, r: NSDate) -> Bool {
   let result = l.compare(r)
   return result == .OrderedDescending || result == .OrderedSame
}