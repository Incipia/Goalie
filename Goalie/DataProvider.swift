//
//  DataProvider.swift
//  Goalie
//
//  Created by Gregory Klein on 12/4/15.
//  Copyright © 2015 Incipia. All rights reserved.
//

import Foundation
import UIKit

protocol DataProviderProtocol: class
{
   associatedtype Object
   func objectAtIndexPath(_ indexPath: IndexPath) -> Object
   func numberOfItemsInSection(_ section: Int) -> Int
}

protocol DataProviderDelegate: class
{
   associatedtype Object
   func dataProviderDidUpdate(_ updates: [DataProviderUpdate<Object>]?)
}

enum DataProviderUpdate<Object>
{
   case insert(IndexPath)
   case update(IndexPath, Object)
   case move(IndexPath, IndexPath)
   case delete(IndexPath)
}

// PUT THIS IN IT'S OWN FILE
protocol DataSourceDelegate: class
{
   associatedtype Object
   func cellIdentifierForObject(_ object: Object) -> String
   func configureCell(_ cell: UITableViewCell, atIndexPath indexPath: IndexPath)
}

protocol ConfigurableCell
{
   associatedtype DataSource
   func configureForObject(_ object: DataSource, atIndexPath indexPath: IndexPath)
}

protocol TableViewDelegateProtocol
{
   associatedtype Object
   func objectSelected(_ object: Object)
   func heightForRowAtIndexPath(_ indexPath: IndexPath) -> CGFloat
}
