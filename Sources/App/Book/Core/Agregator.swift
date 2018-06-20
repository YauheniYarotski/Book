//
//  Agregator.swift
//  App
//
//  Created by Yauheni Yarotski on 6/18/18.
//

import Foundation


class Agregator {
  var exchangesBooks = [Exchange : [String: PairBook]]()
  
  func add(newBooks: [Exchange : [String: PairBook]]) {
    for (exchange, book) in newBooks {
      exchangesBooks[exchange] = book
    }
    //    print(exchangesBooks)
  }
  
}
