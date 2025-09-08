//
//  ContentView.swift
//  Hello World
//
//  Created by Khoi Nguyen on 8/28/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack(alignment: .bottom) { //layer on top of each other
            VStack {
                NavBar()
                ScrollView(.vertical) {
                    OrderInfo()
                    GridView()
                    .padding()
                    Spacer()
                }
            }
            AddtoCart()
                .padding(.bottom)
        }
    }
}

struct NavBar: View {
    var body: some View{
        HStack {
            //left
            Image(systemName: "chevron.backward")
                .resizable()
                .frame(width:10, height: 15)
                .foregroundColor(.purple)
            
            Spacer() //divides left and right content
            
            //right
            HStack(spacing:8) {
                Image(systemName: "person.circle")
                    .resizable()
                    .frame(width: 25, height: 25)
                    .foregroundColor(.purple)
                Image(systemName: "square.grid.2x2")
                    .resizable()
                    .frame(width: 25, height: 25)
                    .foregroundColor(.purple)
            }
        }
        .padding(.horizontal, 20) //adds margain of 20
    } //end of view
}


struct OrderInfo: View {
    var body: some View {
        VStack {
            Text("Matcha Latte")
                .font(.title2).bold()
                .foregroundColor(.purple)
            Text("198 cal")
                .font(.caption).italic()
                .foregroundColor(.purple)
            Image("matcha latte png 2")
                .resizable()
                .frame(width:150, height:300)
            
            //price
            VStack() {
                HStack {
                    Text("$6.75")
                        .font(.callout).bold()
                    HStack {
                        Text("-")
                        Text("1")
                        Text("+")
                    }
                }
            } //end of pricing
            
            //description
            VStack(alignment: .leading, spacing: 8){
                Text("Description")
                    .font(.title2).bold()
                    .foregroundColor(.purple)
                
                Text("Cold and hand-whisked organic ceremonial grade matcha layered with whole milk.")
                
                Text("*milk substitution available")
                    .font(.caption).bold()
            } //end of description
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal, 20)
        } // end of main vstack
    }
}

struct AddtoCart: View {
    var body: some View {
        HStack(spacing: 1) {
            Image(systemName: "cart.badge.plus")
                .foregroundColor(.white)
                .frame(width: 50, height: 50)
            Text("Add to Cart")
                .font(.title3).bold()
                .foregroundColor(.white)
        }
        .frame(maxWidth: .infinity)
        .frame(height: 45)
        .background(
            RoundedRectangle(cornerRadius: 18)
                .fill(Color.purple)
                .shadow(radius: 5)
        .padding(.horizontal, 20)
        )
    }
}

struct GridView: View {
    var body: some View{
        VStack(alignment: .leading, spacing: 12) {
            Text("Recently Viewed")
                .font(.title2).bold()
                .foregroundColor(.purple)
            Grid() {
                GridRow {
                    VStack(alignment: .leading){
                        Image("AlohaMango")
                            .resizable()
                            .frame(width:175, height:250)
                            .cornerRadius(8)
                        Text("Aloha Mango")
                            .font(.caption).bold()
                    }
                    
                    VStack(alignment: .leading){
                        Image("greentea")
                            .resizable()
                            .frame(width:175, height:250)
                            .cornerRadius(8)
                        Text("Green Thai Tea")
                            .font(.caption).bold()
                    }
                } //GridRow
            } //Grid
        } //VStack
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
