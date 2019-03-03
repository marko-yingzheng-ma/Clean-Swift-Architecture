//
//  CreateOrderPresenter.swift
//  CleanStore
//
//  Created by Yingzheng Ma on 1/25/19.
//  Copyright (c) 2019 Yingzheng Ma. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol CreateOrderPresentationLogic
{
  func presentExpirationDate(response: CreateOrder.FormatExpirationDate.Response)
  func presentCreateOrder(response: CreateOrder.CreateOrder.Response)
  func presentUpdatedOrder(response: CreateOrder.UpdateOrder.Response)
}

class CreateOrderPresenter: CreateOrderPresentationLogic
{
  weak var viewController: CreateOrderDisplayLogic?
  
  let dateFormatter: DateFormatter = {
    let dateFormatter = DateFormatter()
    dateFormatter.dateStyle = .short
    dateFormatter.timeStyle = .none
    return dateFormatter
  }()
  
  func presentExpirationDate(response: CreateOrder.FormatExpirationDate.Response) {
    let date = dateFormatter.string(from: response.date)
    let viewModel = CreateOrder.FormatExpirationDate.ViewModel(date: date)
    viewController?.displayExpirationDate(viewModel)
  }
  
  func presentCreateOrder(response: CreateOrder.CreateOrder.Response) {
    
  }
  
  func presentUpdatedOrder(response: CreateOrder.UpdateOrder.Response) {
    
  }
}
