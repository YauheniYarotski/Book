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
  
  let worker = MultiThreadedEventLoopGroup(numberOfThreads: 1)
  var ws: WebSocket?
  
  func start() {
    _ = HTTPClient.webSocket(scheme: .wss, hostname: "stream.binance.com", port: 9443, path: "/ws/btcusdt@depth", on: self.worker).map{ ws in
      // Set a new callback for receiving text formatted data.
      ws.onText { ws, text in
        print("Server echo: \(text)")
      }
      ws.onError{ (ws, error) in
        print(error)
      }
    }
  }
}
