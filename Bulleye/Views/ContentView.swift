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
    ZStack {
      Color("BackgroundColor")
        .ignoresSafeArea()
      VStack {
        InstructionView(game: $game)
        SliderView(sliderValue: $sliderValue)
        HitMeButton(isAlertVisible: $isAlertVisible, sliderValue: $sliderValue, game: $game)
      }
    }
    
  }
}

struct InstructionView: View {
  @Binding var game: Game
  
  var body: some View {
    VStack {
      InstructionText(text: "🎯🎯🎯🎯 \n PUT THE BULLSEYE AS CLOSE AS YOU CAN TO")
        .padding(.horizontal, 30)
      BigNumberText(text: String(game.target))
    }
    .padding()
  }
}

struct SliderView: View {
  @Binding var sliderValue: Double
  var body: some View {
    HStack {
      SliderLabelText(text: "1")
      Slider(value: $sliderValue, in: 1.0...100.0)
      SliderLabelText(text: "100")
    }
  }
}

struct HitMeButton: View{
  @Binding var isAlertVisible: Bool
  @Binding var sliderValue: Double
  @Binding var game: Game
  
  var body: some View {
    Button("Hit me".uppercased()) {
      isAlertVisible = true
    }
    .padding(20.0)
    .background(
      ZStack {
        Color("ButtonColor")
        LinearGradient(gradient: Gradient(colors: [Color.white.opacity(0.3), Color.clear]), startPoint: .top, endPoint: .bottom)
      }
    )
    .foregroundColor(.white)
    .cornerRadius(21.0)
    .bold()
    .font(.title3)
    .alert(
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

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
    ContentView()
      .preferredColorScheme(.dark)
      .previewDevice("iPhone 14")
    
  }
}
