//
//  bookMain.swift
//  Book
//
//  Created by Yauheni Yarotski on 6/5/18.
//

import Vapor
import ObjectMapper
import Console

class BinanceWs {
  
  var books = ExchangeBook()
  
  func start(_ app: Application, onResponse:@escaping ((_ books: ExchangeBook)->())) {
    _ = HTTPClient.webSocket(scheme: .wss, hostname: "stream.binance.com", port: 9443, path: "/ws/btcusdt@depth", on: app).map{ ws in
      ws.onText { ws, text in
         let binanceBookForPair = Mapper<BinanceBookForPair>().map(JSONString: text)!
        
        
       self.add(newBook: binanceBookForPair)
        
//        print(self.books[binanceBookForPair.symbol]?.asks, self.books[binanceBookForPair.symbol]?.bids)
        onResponse(self.books)
      }
      ws.onError{ (ws, error) in
        print(error)
      }
    }
  }
  
  func add(newBook: BinanceBookForPair) {
    
    if var book = self.books[newBook.symbol] {
      
      for ask in newBook.asks {
        let price = ask.key
        let quantity = ask.value
        quantity.double == 0 ? (book.asks[price] = nil) : (book.asks[price] = quantity)
      }
      
      for bid in newBook.bids {
        let price = bid.key
        let quantity = bid.value
        quantity.double == 0 ? (book.bids[price] = nil) : (book.bids[price] = quantity)
      }
      
      self.books[newBook.symbol] = book
      
    } else {
      var pairBook = PairBook()
      pairBook.symbol = newBook.symbol
      pairBook.asks = newBook.asks
      pairBook.bids = newBook.bids
      self.books[newBook.symbol] = pairBook
    }
    
  }
  
  
}
