//
//  ResponseModel.swift
//  Nameley
//
//  Created by William Vabrinskas on 12/12/20.
//  Copyright © 2020 William Vabrinskas. All rights reserved.
//

import Foundation

struct ResponseModel<T: Codable>: Codable {
  public var status: Bool
  public var error: String? = nil
  public var result: T?
}
