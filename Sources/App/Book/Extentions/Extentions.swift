//
//  Extentions.swift
//  App
//
//  Created by Yauheni Yarotski on 6/14/18.
//

import Foundation

extension String {
  
  var int: Int {
    if self.isEmpty {
      return 0
    } else {
      return (self as NSString).integerValue
    }
  }
  
  var boolValue: Bool {
    return NSString(string: self).boolValue
  }
  
  var url: URL? {
    return URL(string: self)
  }
  
  func stringByReplacingFirstOccurrenceOfString(
    target: String, withString replaceString: String) -> String
  {
    if let range = self.range(of: target) {
      return self.replacingCharacters(in: range, with: replaceString)
    }
    return self
  }
}
