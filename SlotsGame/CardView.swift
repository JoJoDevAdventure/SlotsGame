//
//  CardView.swift
//  SlotsGame
//
//  Created by Youssef Bhl on 28/12/2021.
//

import SwiftUI

struct CardView: View {
    
    @Binding var  symbol: String
    @Binding var backgound: Color
    
    private let transition: AnyTransition = AnyTransition.move(edge: .bottom)
    
    var body: some View {
        
        VStack {
            if symbol == "apple" {
                Image(symbol)
                .resizable()
                .aspectRatio(1, contentMode: .fit)
                .transition(transition)
            } else if symbol == "cherry" {
                Image(symbol)
                .resizable()
                .aspectRatio(1, contentMode: .fit)
                .transition(transition)
            } else {
                Image(symbol)
                .resizable()
                .aspectRatio(1, contentMode: .fit)
                .transition(transition)
            }
        }
        .background(backgound.opacity(0.5))
        .cornerRadius(20)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(symbol:Binding.constant("cherry"), backgound: Binding.constant(Color.green))
    }
}
