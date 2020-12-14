//
//  NeruoModel.swift
//  Nameley
//
//  Created by William Vabrinskas on 12/12/20.
//  Copyright © 2020 William Vabrinskas. All rights reserved.
//

import Foundation

public enum ActivationMode: String, Codable {
  case reLu, sigmoid, leakyReLu
}

public struct InitModel: Codable {
  public var inputs: Int
  public var outputs: Int
  public var hiddenLayers: Int?
  public var learningRate: Float
  public var bias: Float
  public var activation: ActivationMode
}
