//
//  ContentView.swift
//  KNClickerGameE2
//
//  Created by Khoi Nguyen on 9/4/25.
//

import SwiftUI

struct ContentView: View {
    @State private var clickCount = 0

    var body: some View {
            VStack(alignment: .center, spacing: 12){
                //title
                Text("Crumble the Cookie")
                    .font(.largeTitle).bold()
                    .padding()
                
                //cookie button
                Button(action: {
                    incrementCount()
                }) {
                    if (0...25).contains(clickCount) {
                        Image("cookie1")
                            .resizable()
                            .frame(width: 150, height: 150)
                    }
                    else if (26...50).contains(clickCount) {
                        Image("cookie2")
                            .resizable()
                            .frame(width: 150, height: 150)
                    }
                    else {
                        Image("cookie3")
                            .resizable()
                            .frame(width: 150, height: 150)
                    }
                }
                
                //counter
                if (clickCount < 49) {
                    Text("Count: \(clickCount)")
                        .font(.title3)
                }
                else {
                    Text("You crumbled the Cookie!")
                        .font(.title3)
                }
                
                //captions
                if(clickCount == 0) {
                    Text("Tap the cookie until it crumbles!")
                        .font(.caption).italic().bold()
                }
                else if(clickCount > 0 && clickCount < 20) {
                    Text("This is a tough cookie.")
                        .font(.caption).italic().bold()
                }
                else if(clickCount >= 20 && clickCount < 25) {
                    Text("I can feel the cracks starting to form!")
                        .font(.caption).italic().bold()
                }
                else if(clickCount >= 25 && clickCount < 45) {
                    Text("So close to crumbling! Keep tapping!")
                        .font(.caption).italic().bold()
                }
                else if(clickCount >= 45 && clickCount < 50) {
                    Text("Look how the cookie crumble...")
                        .font(.caption).italic().bold()
                }
                else {
                    Text("")
                }
            } //VStack2 End
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding()
    }

    func incrementCount() {
        clickCount += 1
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
