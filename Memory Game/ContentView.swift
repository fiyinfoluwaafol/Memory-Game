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
        VStack {
            
            HStack {
                // ✅ Reset Button
                Button(action: {
                    resetGame() // Calls the function we wrote earlier
                }) {
                    Text("Reset Game")
                        .font(.headline)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding(.horizontal)
                
                
                Button(action: {
                }) {
                    Text("Choose Size")
                        .font(.headline)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.orange)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding(.horizontal)
                       
            }
            
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

    }

    func flipCard(at index: Int) {
        if flippedCards.contains(index) {
            // ✅ If user taps the same card again, remove it from flippedCards
            flippedCards.removeAll { $0 == index }
            cards[index].isFlipped.toggle()
            return
        }

        if flippedCards.count < 2 {
            cards[index].isFlipped.toggle()
            flippedCards.append(index)
        }

        if flippedCards.count == 2 {
            let firstIndex = flippedCards[0]
            let secondIndex = flippedCards[1]

            if cards[firstIndex].emoji == cards[secondIndex].emoji {
                print(">>> Correct!\n")
                
                // ✅ Mark cards as "removed" instead of deleting immediately
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    cards[firstIndex].isMatched = true  // ✅ Mark cards as matched
                    cards[secondIndex].isMatched = true
                    flippedCards.removeAll()
                }
            } else {
                // ❌ Cards do not match → Flip back after delay
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    cards[firstIndex].isFlipped.toggle()
                    cards[secondIndex].isFlipped.toggle()
                    flippedCards.removeAll()
                }
            }
        }
    }
    
    func resetGame() {
        // ✅ Reinitialize the `cards` array with fresh, shuffled cards
        cards = [
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
        ].shuffled() // ✅ Shuffle the cards for randomness

        // ✅ Reset card states
        for i in cards.indices {
            cards[i].isFlipped = false
            cards[i].isMatched = false
        }

        // ✅ Clear flipped cards tracking
        flippedCards.removeAll()
    }

}

#Preview {
    ContentView()
}
