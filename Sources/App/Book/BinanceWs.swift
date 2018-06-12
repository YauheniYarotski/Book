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
    let worker = MultiThreadedEventLoopGroup(numberOfThreads: 1)
  func start(_ app: Application) {
    print("start ws")
    do {
      ws = try HTTPClient.webSocket(scheme: .wss, hostname: "stream.binance.com", port: 9443, path: "/ws/btcusdt@depth", on: worker).wait()
    } catch {
      print("error")
    }
    ws?.onText { ws, text in
      print(text)
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
