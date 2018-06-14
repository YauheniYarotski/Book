//
//  AppDelegate.swift
//  App
//
//  Created by Yauheni Yarotski on 6/14/18.
//

import Foundation
import Vapor

class AppDelegate {
  
  let binanceWs = BinanceWs()
  let app: Application
  
  init(_ app: Application) {
    self.app = app
  }
  
  
  func start() {
    binanceWs.start(self.app)
  }
  
}
