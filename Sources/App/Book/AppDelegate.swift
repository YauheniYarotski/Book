//
//  AppDelegate.swift
//  App
//
//  Created by Yauheni Yarotski on 6/14/18.
//

import Foundation
import Vapor

class AppDelegate {
  
  static let shared = AppDelegate()
  //  let bitfinexWs = BitfinexWs()
  var app: Application!
  let mainManager = MainManager()
  
  
  init() {
  }
  
  
  func start() {
    mainManager.start()
  }
  
}
