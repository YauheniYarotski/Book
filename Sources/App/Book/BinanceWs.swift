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
  
  var ws: WebSocket?
  //  let worker = MultiThreadedEventLoopGroup(numberOfThreads: 1)
  func start(_ app: Application) {
    print("start ws")
    do {
      ws = try HTTPClient.webSocket(scheme: .wss, hostname: "stream.binance.com", port: 9443, path: "/ws/btcusdt@depth", on: app).wait()
    } catch {
      print("error")
    }
    ws?.onText { ws, text in
      guard let ticker = Mapper<Ticker>().map(JSONString: text) else {
        print(" ticker is nil")
        return
        
      }
      
      for priceLevel in ticker.asks {
        if let p = priceLevel.first as? String, let l = priceLevel[1] as? String {
          print("asks:", p, l)
        }
      }
    }
    print("before close ws")
    do {
      try ws?.onClose.wait()
    } catch {
      print("on close error")
    }
    
    print("after close ws")
  }
}
