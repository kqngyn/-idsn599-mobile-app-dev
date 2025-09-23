//
//  ContentView.swift
//  Khoi Nguyen - Exercise 4 - Touches and Gestures
//
//  Created by Khoi Nguyen on 9/18/25.
//
import SwiftUI

struct ContentView: View {
    // Game state
    @State private var score = 0
    @State private var message = "Press & hold to grow. Release to match!"
    
    // Bubble you control
    @State private var bubbleRadius: CGFloat = 20
    @State private var isHolding = false
    @State private var holdStart: Date? = nil
    
    // Target ring (just a size to match)
    @State private var targetRadius: CGFloat = .random(in: 40...140)
    
    // Tuning
    let growRate: CGFloat = 90     // points per second
    let maxRadius: CGFloat = 160
    let tolerance: CGFloat = 12    // how close you need to be to score
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [.black, .purple.opacity(0.35)],
                           startPoint: .top, endPoint: .bottom)
            .ignoresSafeArea()
            
            VStack(spacing: 24) {
                // Score
                Text("Score: \(score)")
                    .font(.title2.weight(.semibold))
                    .foregroundColor(.yellow)
                    .padding(8)
                    .background(.ultraThinMaterial, in: Capsule())
                
                Spacer()
                
                ZStack {
                    // Target ring to match (size only, centered)
                    Circle()
                        .strokeBorder(Color.mint.opacity(0.9), lineWidth: 6)
                        .frame(width: targetRadius * 2, height: targetRadius * 2)
                        .overlay(
                            Text("Target")
                                .font(.caption)
                                .foregroundColor(.mint)
                                .offset(y: -targetRadius - 16)
                        )
                    
                    // Your bubble (grows while holding)
                    Circle()
                        .fill(Color.white.opacity(0.95))
                        .frame(width: bubbleRadius * 2, height: bubbleRadius * 2)
                        .shadow(radius: 6, y: 2)
                        .overlay(
                            Text("\(Int(bubbleRadius))")
                                .font(.caption.bold())
                                .foregroundColor(.black.opacity(0.6))
                        )
                }
                .frame(height: 360)
                
                Text(message)
                    .font(.footnote)
                    .foregroundColor(.white.opacity(0.9))
                    .padding(8)
                    .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 12))
                
                Spacer()
            }
            .padding()
        }
        // Whole screen is touchable
        .contentShape(Rectangle())
        .gesture(DragGesture(minimumDistance: 0)
            .onChanged { _ in
                // Start hold
                if !isHolding {
                    isHolding = true
                    holdStart = Date()
                    message = "Holding… release to match!"
                }
                // Update size while holding
                if let start = holdStart {
                    let elapsed = CGFloat(-start.timeIntervalSinceNow)
                    bubbleRadius = min(max(20, 20 + growRate * elapsed), maxRadius)
                }
            }
            .onEnded { _ in
                // Release: check match
                isHolding = false
                let diff = abs(bubbleRadius - targetRadius)
                if diff <= tolerance {
                    score += 1
                    message = "Nice! +1 ⭐️"
                } else {
                    message = "Off by \(Int(diff)) • Try again!"
                }
                // Reset player bubble; new target
                bubbleRadius = 20
                holdStart = nil
                withAnimation(.easeOut(duration: 0.2)) {
                    targetRadius = .random(in: 40...140)
                }
            }
        )
        .preferredColorScheme(.dark)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

