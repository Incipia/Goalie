//
//  ParentGoalsFetchRequestProvider.swift
//  Goalie
//
//  Created by Gregory Klein on 12/8/15.
//  Copyright © 2015 Incipia. All rights reserved.
//

import Foundation
import CoreData

class DefaultTasksFetchRequestProvider
{
   fileprivate static let _sharedProvider = DefaultTasksFetchRequestProvider()
   
   fileprivate lazy var fetchRequest: NSFetchRequest<NSFetchRequestResult> = {
      let request = Task.sortedFetchRequest
      request.returnsObjectsAsFaults = false
      request.fetchBatchSize = 20
      
      return request
   }()
   
   class var fetchRequest: NSFetchRequest<NSFetchRequestResult> {
      return _sharedProvider.fetchRequest
   }
}
