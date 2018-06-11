import Vapor
import Async

/// Called after your application has initialized.

public func boot(_ app: Application) throws {
//  DispatchQueue.global().async {
    BinanceWs.shared.start(app)
//  }
  
}
