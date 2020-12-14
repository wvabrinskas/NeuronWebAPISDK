//
//  NetworkCoordinator.swift
//  Nameley
//
//  Created by William Vabrinskas on 12/12/20.
//  Copyright © 2020 William Vabrinskas. All rights reserved.
//

import Foundation
import SimpleApiClient

public enum Endpoint: String {
  case initialize = "init"
  case get = "get"
  case train = "train"
  
  func build(_ base: String) -> String {
    return "\(base)/\(self.rawValue)"
  }
}

public protocol NeuronConnector: SimpleApiClient, Logger {
  var serverUrl: String { get set }
  
  func execute<T: Codable, TResult: Codable>(model: T,
                                             _ endpoint: Endpoint,
                                             complete: ((_ result: TResult?) -> ())?)
}

extension NeuronConnector {
  
  func execute<T: Codable, TResult: Codable>(model: T, _ endpoint: Endpoint, complete: ((_ result: TResult?) -> ())? = nil) {
    do {
      let data = try JSONEncoder().encode(model)
      
      self.post(endpoint: endpoint.build(self.serverUrl),
                headers: [:], data: data) { (data, response, error) in
        do {
          let responseData: ResponseModel<TResult>? = try self.decode(data: data)
          
          let log = "error: \(responseData?.error) result: \(responseData?.result)"
          self.log(type: .Success, message: log)
          
          complete?(responseData?.result)
          return
        } catch {
          
          self.log(type: .Error, message: error.localizedDescription)
        }
        complete?(nil)
      }
    } catch {
      self.log(type: .Error, message: error.localizedDescription)
    }
  }
  
}
