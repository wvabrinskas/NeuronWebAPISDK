import XCTest
@testable import NeuronWebAPISDK

final class NeuronWebAPISDKTests: XCTestCase, NeuronConnector {
  var serverUrl: String = ""
  
  static var authorizationHeaders: [String : String]?
  
  var logLevel: LogLevel = .low
  
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
