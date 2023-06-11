//
//  ContentView.swift
//  Bulleye
//
//  Created by MAC on 08/06/2023.
//

import SwiftUI

struct ContentView: View {
  @State private var isAlertVisible = false
  @State private var sliderValue = 50.0
  @State private var game = Game()
  
  var body: some View {
    VStack {
      Text("🎯🎯🎯🎯 \n PUT THE BULLSEYE AS CLOSE AS YOU CAN TO")
        .bold()
        .multilineTextAlignment(.center)
        .lineSpacing(4.0)
        .font(.footnote)
        .kerning(2.0)
      Text(String(game.target)).bold()
        .kerning(-1.0)
        .font(.largeTitle)
        .fontWeight(.black)
      HStack {
        Text("1")
          .bold()
        Slider(value: $sliderValue, in: 1.0...100.0)
        Text("100")
          .bold()
      }
      Button("Hit me") {
        isAlertVisible = true
      }.alert(
        "Hello there",
        isPresented: $isAlertVisible,
        actions: {
          Button("Awesome") {
            print("Alert closed")
          }
        },
        message: {
          let roundedValue = Int(sliderValue.rounded())
          Text("""
              The slider's value is \(sliderValue),
          You Scored is \(game.points(sliderValue: roundedValue)) points this round.
          """)
        }
      )
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
