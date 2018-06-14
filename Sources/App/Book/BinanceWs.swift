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
    
    
    print("after close ws")
  }
}
