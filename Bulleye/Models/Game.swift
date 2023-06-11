
import Foundation

struct Game {
  var target = Int.random(in: 1...100)
  var score = 0
  var round = 1
  
//  func points(sliderValue: Int) -> Int {
//    var diff: Int
//    if target > sliderValue {
//      diff = target - sliderValue
//    }
//    else if sliderValue > target {
//      diff = sliderValue - target
//    }
//    else {
//      diff = 0
//    }
//    return 100 - diff
//  }
  
//  func points(sliderValue: Int) -> Int {
//    return 100 - abs(target - sliderValue)
//  }
  
  func points(sliderValue: Int) -> Int {
    100 - abs(target - sliderValue)
  }
  
}
