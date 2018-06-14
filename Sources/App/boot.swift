import Vapor
import Async

/// Called after your application has initialized.

public func boot(_ app: Application) throws {
  
  let appD = AppDelegate(app)
  appD.start()

  
}




