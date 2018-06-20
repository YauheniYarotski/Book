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
  
  func start(onResponse:@escaping ((_ binanceNewLevels: [String: BinanceBookForPair])->())) {
    _ = HTTPClient.webSocket(scheme: .wss, hostname: "stream.binance.com", port: 9443, path: "/ws/btcusdt@depth", on: worker).map{ ws in
      ws.onText { ws, text in
        let binanceBookForPair = Mapper<BinanceBookForPair>().map(JSONString: text)!
        let binanceNewLevels = [binanceBookForPair.symbol: binanceBookForPair]
        
        onResponse(binanceNewLevels)
      }
      ws.onError{ (ws, error) in
        print("BinanceWs error: ",error)
      }
    }
  }
}
