//
//  CardView.swift
//  Memory Game
//
//  Created by Fiyinfoluwa Afolayan on 2/18/25.
//

import SwiftUI

struct Card: View {
    
    @State private var isFlipped = false
    
    var emoji: String
    
    static let mockedCards = [
        Card(emoji: "💀"), Card(emoji: "💀"),
        Card(emoji: "🐶"), Card(emoji: "🐶"),
        Card(emoji: "🐱"), Card(emoji: "🐱"),
        Card(emoji: "🐭"), Card(emoji: "🐭"),
        Card(emoji: "🐸"), Card(emoji: "🐸"),
        Card(emoji: "🦊"), Card(emoji: "🦊"),
        Card(emoji: "🐯"), Card(emoji: "🐯"),
        Card(emoji: "🐷"), Card(emoji: "🐷"),
        Card(emoji: "🐹"), Card(emoji: "🐹"),
        Card(emoji: "🐰"), Card(emoji: "🐰")
    ]
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25.0)
                .fill(isFlipped ? .white : .blue)
                .stroke(isFlipped ? .black : .blue, lineWidth: 2)
            if isFlipped {
                Text(emoji)
                    .font(.system(size: 40))
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
            }
        }
        .frame(width: 100, height: 150)
        .onTapGesture {
            isFlipped.toggle()
        }
    }
}

#Preview {
    Card(emoji: "🐶")
}
