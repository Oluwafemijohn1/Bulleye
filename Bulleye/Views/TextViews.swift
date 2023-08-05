//
//  TextViews.swift
//  Bulleye
//
//  Created by MAC on 24/06/2023.
//

import SwiftUI

struct InstructionText: View {
  var text: String
  
  var body: some View {
    Text(text.uppercased())
      .bold()
      .multilineTextAlignment(.center)
      .lineSpacing(4.0)
      .font(.footnote)
      .kerning(2.0)
      .foregroundColor(Color("TextColor"))
  }
}

struct BigNumberText: View {
  var text: String
  
  var body: some View {
    Text(text).bold()
      .kerning(-1.0)
      .font(.largeTitle)
      .fontWeight(.black)
      .foregroundColor(Color("TextColor"))
  }
}

struct SliderLabelText: View {
  var text: String
  
  var body: some View {
    Text(text)
      .bold()
      .foregroundColor(Color("TextColor"))
  }
}

struct TextViews_Previews: PreviewProvider {
  static var previews: some View {
    VStack {
      InstructionText(text: "🎯🎯🎯🎯 \n PUT THE BULLSEYE AS CLOSE AS YOU CAN TO")
        .padding(.horizontal, 30)
      BigNumberText(text: "20")
    }
  }
}
