//
//  ContentView.swift
//  Memory Game
//
//  Created by Fiyinfoluwa Afolayan on 2/18/25.
//

import SwiftUI

struct ContentView: View {
    @State private var cards: [Card] = [
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
    ].shuffled()

    @State private var flippedCards: [Int] = [] // Track flipped card indices

    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]

    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 15) {
                ForEach(cards.indices, id: \.self) { index in
                    CardView(card: cards[index]) {
                        flipCard(at: index)
                    }
                }
            }
            .padding(.horizontal)
        }
        .frame(maxHeight: .infinity)
    }

    func flipCard(at index: Int) {
        if flippedCards.contains(index) {
            // ✅ User tapped the same card again, so remove it from flippedCards
            flippedCards.removeAll { $0 == index }
            cards[index].isFlipped.toggle()
            return
        }

        if flippedCards.count < 2 {
            cards[index].isFlipped.toggle()
            flippedCards.append(index)
        }
    }
}

#Preview {
    ContentView()
}
