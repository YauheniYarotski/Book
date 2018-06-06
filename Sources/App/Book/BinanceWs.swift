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
  
  static let shared = BinanceWs()
  let terminal = Terminal()
  
  var ws: WebSocket!
  let worker = MultiThreadedEventLoopGroup(numberOfThreads: 1)
  
  init() {
  }
  
  func start() {
    terminal.print("start")
    
    ws = try! HTTPClient.webSocket(scheme: .wss, hostname: "stream.binance.com", port: 9443, path: "/ws/btcusdt@depth", on: worker).wait()
    
    ws.onText { ws, text in
      //      print("Server echo: \(text)")
      
      let ticker = Mapper<Ticker>().map(JSONString: text)!
      
      for priceLevel in ticker.asks {
        if let p = priceLevel.first as? String, let l = priceLevel[1] as? String {
//          print("asks:", p, l)
          self.terminal.print("asks:" + " \(p)" + " \(l)")
        }
      }
      
      for priceLevel in ticker.bids {
        if let p = priceLevel.first as? String, let l = priceLevel[1] as? String {
//          print("bids:", p, l)
          self.terminal.print("bids:" + " \(p)" + " \(l)")
        }
      }
      
      
      
    }
    
    // Wait for the Websocket to closre.
    try! ws.onClose.wait()
    
  }
  
}
