import Vapor
import Async

/// Called after your application has initialized.

public func boot(_ app: Application) throws {
//  DispatchQueue.global().async {
//    let ws = HTTPClient.webSocket(scheme: .wss, hostname: "stream.binance.com", port: 9443, path: "/ws/btcusdt@depth", on: app).wait()
//
//    ws.onText { ws, text in
//      print(text)
//    }
//    print("before close ws")
//     ws.onClose.wait()
//
//  }
  
  
  _ = HTTPClient.webSocket(scheme: .wss, hostname: "stream.binance.com", port: 9443, path: "/ws/btcusdt@depth", on: app).map{ ws in
    // Set a new callback for receiving text formatted data.
    ws.onText { ws, text in
      print("Server echo: \(text)")
    }
    
    // Send a message.
//    ws.send("Hello, world!")
    
  }
}




