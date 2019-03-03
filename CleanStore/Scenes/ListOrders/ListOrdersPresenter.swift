//
//  ListOrdersPresenter.swift
//  CleanStore
//
//  Created by Yingzheng Ma on 1/27/19.
//  Copyright (c) 2019 Yingzheng Ma. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol ListOrdersPresentationLogic
{
  func presentFetchedOrders(response: ListOrders.FetchOrders.Response)
}

class ListOrdersPresenter: ListOrdersPresentationLogic
{
  weak var viewController: ListOrdersDisplayLogic?
  let dateFormatter: DateFormatter = {
    let dateFormatter = DateFormatter()
    dateFormatter.dateStyle = .short
    dateFormatter.timeStyle = .none
    return dateFormatter
  }()
  let currencyFormatter: NumberFormatter = {
    let currencyFormatter = NumberFormatter()
    currencyFormatter.numberStyle = .currency
    return currencyFormatter
  }()
  
  // MARK: Present fetched orders
  
  func presentFetchedOrders(response: ListOrders.FetchOrders.Response) {
    var displayedOrders: [ListOrders.FetchOrders.ViewModel.DisplayedOrder] = []
    
    for order in response.orders {
      let date = dateFormatter.string(from: order.date)
      let total = currencyFormatter.string(from: order.total)
      let displayedOrder = ListOrders.FetchOrders.ViewModel.DisplayedOrder(id: order.id!, date: date, email: order.email, name: "\(order.firstName) \(order.lastName)", total: total!)
      displayedOrders.append(displayedOrder)
    }
    
    let viewModel = ListOrders.FetchOrders.ViewModel(displayedOrders: displayedOrders)
    viewController?.displayFetchedOrders(viewModel: viewModel)
  }
}
