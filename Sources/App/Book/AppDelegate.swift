//
//  AppDelegate.swift
//  App
//
//  Created by Yauheni Yarotski on 6/14/18.
//

import Foundation
import Vapor

class AppDelegate {
  
  
  //  let bitfinexWs = BitfinexWs()
  let app: Application
  let mainManager = MainManager()
  
  
  init(_ app: Application) {
    self.app = app
//    app.eventLoop.sh
  }
  
  
  func start() {
    mainManager.start()
  }
  
}
