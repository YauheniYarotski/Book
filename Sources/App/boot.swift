import Vapor
import Async

/// Called after your application has initialized.

public func boot(_ app: Application) throws {
  //  DispatchQueue.global().async {
  //    BinanceWs.shared.start(app)
  //  }
  
  
  var ws = try HTTPClient.webSocket(scheme: .wss, hostname: "stream.binance.com", port: 9443, path: "/ws/btcusdt@depth", on: app).wait()
  
  ws.onText { ws, text in
    print(text)
  }
  print("before close ws")
  try ws.onClose.wait()
  
  
}
