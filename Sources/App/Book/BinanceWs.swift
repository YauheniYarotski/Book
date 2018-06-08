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

  func start(_ app: Application) {

    do {
    ws = try HTTPClient.webSocket(scheme: .wss, hostname: "stream.binance.com", port: 9443, path: "/ws/btcusdt@depth", on: app).wait()
    } catch {
      print("error")
    }
    ws.onText { ws, text in
      let ticker = Mapper<Ticker>().map(JSONString: text)!

      for priceLevel in ticker.asks {
        if let p = priceLevel.first as? String, let l = priceLevel[1] as? String {
          print("asks:", p, l)
        }
      }
    }
    print("exit")
    try! ws.onClose.wait()
  }
  
}
