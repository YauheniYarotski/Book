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
  
  var ws: WebSocket!
  let worker = MultiThreadedEventLoopGroup(numberOfThreads: 2)
  
  
  func start(_ app: Application) {
    print("startdgdf ")
    
//    let done = try! app.client().webSocket("wss://stream.binance.com:9443/ws/btcusdt@depth").flatMap { ws -> Future<Void> in
//      // setup an on text callback that will print the echo
//      ws.onText { ws, text in
//        print("rec: \(text)")
//        // close the websocket connection after we recv the echo
////        ws.close()
//      }
//
//      // when the websocket first connects, send message
////      ws.send("hello, world!")
//
//      // return a future that will complete when the websocket closes
//      return ws.onClose
//    }
//
//    print(done) // Future<Void>
//
//    // wait for the websocket to close
//    try! done.wait()
    
    ws = try! HTTPClient.webSocket(scheme: .wss, hostname: "stream.binance.com", port: 9443, path: "/ws/btcusdt@depth", on: worker).wait()
//
//    ws.onText { ws, text in
////      print(text)
//      let ticker = Mapper<Ticker>().map(JSONString: text)!
//
//      for priceLevel in ticker.asks {
//        if let p = priceLevel.first as? String, let l = priceLevel[1] as? String {
//          print("asks:", p, l)
//        }
//      }
//    }
    print("exit")
//    try! ws.onClose.wait()
    
  }
  
}
