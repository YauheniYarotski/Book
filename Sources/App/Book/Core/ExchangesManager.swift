//
//  ExchangeManager.swift
//  App
//
//  Created by Yauheni Yarotski on 6/18/18.
//

import Foundation
//import Jobs
import Jobs
import Dispatch

class ExchangesManager {
  
  let binanceManager = BinanceManager()
  var exchangesWithBooks = [Exchange : [String: PairBook]]()
  

  
  func startGetingData() {
    binanceManager.start()
    startCollectionDataFromExchanges()
  }
  
  
  private func startCollectionDataFromExchanges() {
    Jobs.add(interval: .seconds(2)) {
      self.getDataFromExchanges()
    }
  }
  
  func getDataFromExchanges() {
    exchangesWithBooks[.binance] = binanceManager.book
  }
  
}


