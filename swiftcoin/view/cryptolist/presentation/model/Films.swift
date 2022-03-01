//
//  Films.swift
//  swiftcoin
//
//  Created by usuario on 28-02-22.
//

import Foundation

struct Films: Decodable {
  let count: Int
  let all: [Film]
  
  enum CodingKeys: String, CodingKey {
    case count
    case all = "results"
  }
}

