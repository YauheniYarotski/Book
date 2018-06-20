//
//  BinanceManager.swift
//  App
//
//  Created by Yauheni Yarotski on 6/18/18.
//

import Foundation
import Vapor

class BinanceManager {
  var book = [String: PairBook]()
    let binanceWs = BinanceWs()
  
  func start() {
    binanceWs.start() { binanceNewLevels in
      for (_, newLevels) in binanceNewLevels {
        self.add(newLevels: newLevels)
//        print(self.book)
      }
    }
  }
  
  private func add(newLevels: BinanceBookForPair) {
    
    if var book = self.book[newLevels.symbol] {
      for ask in newLevels.asks {
        let price = ask.key
        let quantity = ask.value
        quantity.double == 0 ? (book.asks[price] = nil) : (book.asks[price] = quantity)
      }
      
      for bid in newLevels.bids {
        let price = bid.key
        let quantity = bid.value
        quantity.double == 0 ? (book.bids[price] = nil) : (book.bids[price] = quantity)
      }
      
      self.book[newLevels.symbol] = book
      
    } else {
      var pairBook = PairBook()
      pairBook.symbol = newLevels.symbol
      pairBook.asks = newLevels.asks
      pairBook.bids = newLevels.bids
      self.book[newLevels.symbol] = pairBook
    }
  }
}
