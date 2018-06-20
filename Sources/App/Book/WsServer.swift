//
//  WsServer.swift
//  App
//
//  Created by Yauheni Yarotski on 6/15/18.
//

import Foundation

import WebSocket
import Vapor

var websocketClients: [WebSocket] = []

func websocketSendToAll(_ text: String) {
  for ws in websocketClients {
    ws.send(text)
    
  }
}

func chatterHandler(_ ws: WebSocket, req: Request) throws {
  websocketClients.append(ws)
  print("[WS] connected")
  
  ws.onText { (ws, text) in
    print("[WS] onText: \(text)")
    if text == "Hello" {
      ws.send("Hello")
    }
  }
  
  ws.onClose.always {
    if let index = websocketClients.index(where: { w -> Bool in
      return w === ws
    }) {
      websocketClients.remove(at: index)
    }
    print("[WS] onClose")
    
    DispatchQueue.global().async {
      sleep(2)
      print("[WS] onClose after 2 seconds: isClosed=\(ws.isClosed)")
      ws.send("check sending on closed ws")
    }
  }
  
  ws.onError { (ws, error) in
    print("[WS] onError: \(error)")
  }
}
