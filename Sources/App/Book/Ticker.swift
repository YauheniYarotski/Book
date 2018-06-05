//
//  Ticker.swift
//  crypto
//
//  Created by Yauheni Yarotski on 1/4/18.
//

import ObjectMapper
import Foundation

//type BinanceEvents struct {
//  EventType string          `json:"e"`
//  TimeStamp int64           `json:"E"`
//  Symbol string          `json:"s"`
//  FirstId int             `json:"U"`
//  FinalId int             `json:"u"`
//  Bids [][]string `json:"b"`
//  Asks [][]string `json:"a"`
//}

class Ticker: Mappable {
  var eventType: String = ""
  var timeStamp: Date = Date()
  var symbol: String = ""
  var firstId: Int = 0
  var finalId: Int = 0
  var bids : [[Any]] = []
  var asks : [[Any]] = []
  
  init() {
  }
  
  required init?(map: Map) {
  }
  
  func mapping(map: Map) {
    eventType             <- map["e"]
    timeStamp             <- map["E"]
    symbol                <- map["s"]
    firstId               <- map["U"]
    finalId               <- map["u"]
    bids                  <- map["b"]
    asks                  <- map["a"]
  }
  
}

//extension Ticker: Hashable {
//  static func == (lhs: Ticker, rhs: Ticker) -> Bool {
//    return lhs.bid == rhs.bid && lhs.ask == rhs.ask && lhs.last == rhs.last && lhs.timeStamp == rhs.timeStamp
//  }
//
//  var hashValue: Int {
//    return  bid.hashValue ^ ask.hashValue ^ last.hashValue ^ timeStamp.hashValue
//  }
//}
//
//class TickerResponseModel: Mappable {
//  var ticker: Ticker?
//
//  required init?(map: Map) {}
//
//  func mapping(map: Map) {
//    ticker      <- map["result"]
//  }
//}


//class Order: Mappable {
//  var type: OrderType = .none
//  var uuid: String = ""
//  var timeStamp  = Date()
//  init() {
//  }
//
//  required init?(map: Map) {
//  }
//
//  func mapping(map: Map) {
//    uuid             <- map["uuid"]
//    timeStamp       = Date()
//  }
//
//}

//extension Ticker: Hashable {
//  static func == (lhs: Ticker, rhs: Ticker) -> Bool {
//    return lhs.bid == rhs.bid && lhs.ask == rhs.ask && lhs.last == rhs.last && lhs.timeStamp == rhs.timeStamp
//  }
//
//  var hashValue: Int {
//    return  bid.hashValue ^ ask.hashValue ^ last.hashValue ^ timeStamp.hashValue
//  }
//}

//class OrderResponseModel: Mappable {
//  var order: Order?
//  var success: Bool = false
//  var message: String?
//
//  required init?(map: Map) {}
//
//  func mapping(map: Map) {
//    order      <- map["result"]
//    success      <- map["success"]
//    message      <- map["message"]
//  }
//}
//
//class BalanceResponseModel: Mappable {
//  var balance: Double?
//  var available: Double?
//  var success: Bool = false
//  var message: String?
//
//  required init?(map: Map) {}
//
//  func mapping(map: Map) {
//    balance      <- map["result.Balance"]
//    available      <- map["result.Available"]
//    success      <- map["success"]
//    message      <- map["message"]
//  }
//}

