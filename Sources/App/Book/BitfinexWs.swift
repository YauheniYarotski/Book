//
//  BitfinexWs.swift
//  App
///Users/yauheniyarotski/Downloads/data.json
//  Created by Yauheni Yarotski on 6/14/18.
//


import Vapor
import ObjectMapper
import Console


class BitfinexRequest: Mappable {
  var event: String = "subscribe"
  var channel: String = "book"
  var symbol: String = "BTCUSD"
  var prec: String = "P0"
  
  init() {
  }
  
  required init?(map: Map) {
  }
  
  func mapping(map: Map) {
    event             <- map["event"]
    channel           <- map["channel"]
    symbol            <- map["symbol"]
    prec              <- map["prec"]
  }
  
}


class BitfinexPingRequest: Mappable {
  var event: String = "ping"
  init() {
  }
  required init?(map: Map) {
  }
  
  func mapping(map: Map) {
    event             <- map["event"]
  }
  
}

class BitfinexWs {
  
  var books = ExchangeBook()
  
  func start(_ app: Application, onResponse:@escaping ((_ books: ExchangeBook)->())) {
    _ = HTTPClient.webSocket(scheme: .wss, hostname: "api.bitfinex.com", path: "/ws/2/", on: app).map{ ws in
      
      let request = BitfinexPingRequest()
      let text = request.toJSONString(prettyPrint: false)!
      print(text)
      ws.send(text)
      
      ws.onText { ws, text in
        print("Text: ", text)
        
      }
      
      ws.onBinary({ (ws, data) in
        print("Binary: ", data)
      })
      ws.onError{ (ws, error) in
        print("Error: ", error)
      }
      
      ws.onCloseCode({ (wsCode) in
        print("close: ", wsCode)
      })
    }
  }
  
//  func add(newBook: BinanceBookForPair) {
//
//    if var book = self.books[newBook.symbol] {
//
//      for ask in newBook.asks {
//        let price = ask.key
//        let quantity = ask.value
//        quantity.double == 0 ? (book.asks[price] = nil) : (book.asks[price] = quantity)
//      }
//
//      for bid in newBook.bids {
//        let price = bid.key
//        let quantity = bid.value
//        quantity.double == 0 ? (book.bids[price] = nil) : (book.bids[price] = quantity)
//      }
//
//      self.books[newBook.symbol] = book
//
//    } else {
//      var pairBook = PairBook()
//      pairBook.symbol = newBook.symbol
//      pairBook.asks = newBook.asks
//      pairBook.bids = newBook.bids
//      self.books[newBook.symbol] = pairBook
//    }
//
//  }
  
  
}
