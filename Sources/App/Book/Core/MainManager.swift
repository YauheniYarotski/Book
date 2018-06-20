//
//  MainManager.swift
//  App
//
//  Created by Yauheni Yarotski on 6/18/18.
//

import Foundation
import Jobs
import ObjectMapper

class MainManager {
  let exchangesManager = ExchangesManager()
  let agregator = Agregator()
  
  func start() {
    exchangesManager.startGetingData()
    startCollectionDataFromExchanges()
    startSendingDataToWs()
  }
  
  
  private func startCollectionDataFromExchanges() {
    Jobs.add(interval: .seconds(2)) {
      self.getAndWriteDataToAgregator()
    }
  }
  
  private func getAndWriteDataToAgregator() {
    agregator.add(newBooks: exchangesManager.exchangesWithBooks)
  }
  
  private func startSendingDataToWs() {
    Jobs.add(interval: .seconds(2)) {
      self.sendToWs()
    }
  }
  
  private func sendToWs() {
    let books = agregator.exchangesBooks
    var wsBooks = [WsExchangeBooksResponse]()
    for (ex, book) in books {
      let ws = WsExchangeBooksResponse(exchange: ex, book: book)
      wsBooks.append(ws)
    }
    

        let jsonString = wsBooks.toJSONString() ?? "no ws"
        print(jsonString.prefix(100))
    websocketSendToAll(jsonString)
    }
  
}
