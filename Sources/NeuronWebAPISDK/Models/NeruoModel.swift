//
//  NeruoModel.swift
//  Nameley
//
//  Created by William Vabrinskas on 12/12/20.
//  Copyright © 2020 William Vabrinskas. All rights reserved.
//

import Foundation

struct NeuroModel: Codable {
  var inputs: Int
  var outputs: Int
  var hiddenLayers: Int?
  var learningRate: Float
  var bias: Float
}
