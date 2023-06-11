
import XCTest
@testable import Bulleye

final class BulleyeTests: XCTestCase {
  
  var game: Game!
  
  
  override func setUpWithError() throws {
    
    game = Game()
  }
  
  override func tearDownWithError() throws {
    game = nil
  }
  
//  func testExample() throws {
//    XCTAssertEqual(game.points(sliderValue: 50), 999)
//  }
  func testScorePositive(){
    let guess = game.target + 5
    let score = game.points(sliderValue: guess)
    XCTAssertEqual(score, 95)
  }
  
  func testScoreNegative(){
    let guess = game.target - 5
    let score = game.points(sliderValue: guess)
    XCTAssertEqual(score, 95)
  }
}
