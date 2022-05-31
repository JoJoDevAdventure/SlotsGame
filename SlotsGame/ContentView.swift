//
//  ContentView.swift
//  SlotsGame
//
//  Created by Youssef Bhl on 26/12/2021.
//

import SwiftUI

struct ContentView: View {
    
    @State private var symbols = ["apple", "star", "cherry"]
    @State private var numbers = [0,1,2]
    @State private var numbers1 = [0,1,2]
    @State private var numbers2 = [0,1,2]
    @State private var credits = 100
    @State private var HS = 100
    private var bet = 5
    private var superBet = 25
    @State private var backgrounds = [Color.white, Color.white, Color.white]
    @State private var backgrounds1 = [Color.white, Color.white, Color.white]
    @State private var backgrounds2 = [Color.white, Color.white, Color.white]
    @State private var win = false
    @State private var HSCheck = false
    
    var body: some View {
        
        ZStack {
            // Background
                Rectangle()
                    .foregroundColor(Color(red: 200/255, green: 143/255, blue: 32/255))
                    .edgesIgnoringSafeArea(.all)
                Rectangle()
                .foregroundColor(Color(red: 228/255, green: 195/255, blue: 76/255))
                .rotationEffect(Angle(degrees: 45))
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Spacer()
                //title
                HStack {
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                    
                    Text("swiftUI Slots")
                        .bold()
                        .foregroundColor(.white)
                    
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                }.scaleEffect(2)
                
                Spacer()
                
                //crédits counter + High score
                
                HStack {
                    Spacer()
                    Text("Credits: \(String(credits))")
                        .foregroundColor(.black)
                        .padding(.all, 10)
                        .background(win ? Color.green.opacity(0.5) : Color.white.opacity(0.5) )
                        .cornerRadius(20)
                        .scaleEffect(win ? 1.2 : 1)
                    
                    Spacer()
                    
                    Text("High Score: \(String(HS))")
                        .foregroundColor(.black)
                        .padding(.all, 10)
                        .background(HSCheck ? Color.green.opacity(0.5) : Color.white.opacity(0.5))
                        .cornerRadius(20)
                        .scaleEffect(HSCheck ? 1.2 : 1)
                    
                    Spacer()
                }
                
                Spacer()
                
                //Cards
                VStack {
                    HStack {
                        Spacer()
                        
                        CardView(symbol: $symbols[numbers[0]], backgound: $backgrounds[0])
                        
                        CardView(symbol: $symbols[numbers[1]], backgound: $backgrounds[1])
                        
                        CardView(symbol: $symbols[numbers[2]], backgound: $backgrounds[2])
                        
                        Spacer()
                    }
                    
                    HStack {
                        Spacer()
                        
                        CardView(symbol: $symbols[numbers1[2]], backgound: $backgrounds1[0])
                        
                        CardView(symbol: $symbols[numbers1[0]], backgound: $backgrounds1[1])
                        
                        CardView(symbol: $symbols[numbers1[1]], backgound: $backgrounds1[2])
                        
                        Spacer()
                    }
                    
                    HStack {
                        Spacer()
                        
                        CardView(symbol: $symbols[numbers2[1]], backgound: $backgrounds2[0])
                        
                        CardView(symbol: $symbols[numbers2[2]], backgound: $backgrounds2[1])
                        
                        CardView(symbol: $symbols[numbers2[0]], backgound: $backgrounds2[2])
                        
                        Spacer()
                    }
                }
                
                Spacer()
                
                //Buttons
                
                HStack {
                    Spacer()
                    
                    Button(action: {
                        //set win to false
                        self.win = false
                        self.HSCheck = false
                        
                        // substract bets
                        self.credits = credits-bet
                        
                        //set colors back to white
                        for i in 0...2 {
                            self.numbers[i] = Int.random(in: 0...self.symbols.count-1)
                            self.numbers1[i] = Int.random(in: 0...self.symbols.count-1)
                            self.numbers2[i] = Int.random(in: 0...self.symbols.count-1)
                        }
                        
                        // change images :
                        for i in 0...2 {
                            self.numbers[i] = Int.random(in: 0...self.symbols.count-1)
                            self.numbers1[i] = Int.random(in: 0...self.symbols.count-1)
                            self.numbers2[i] = Int.random(in: 0...self.symbols.count-1)
                        }

                        //check winnings row 0
                        if (numbers[0] == numbers [1]) && (numbers[1] == numbers[2]) {
                            //won
                            self.credits += bet*5
                            self.win = true
                            
                            //update backgrounds to green
                            for i in 0...2 {
                                self.backgrounds[i] = Color.green
                            }
                        }
                        
                        //check winnings row 1
                        if (numbers1[0] == numbers1 [1]) && (numbers1[1] == numbers1[2]) {
                            //won
                            self.credits += bet*5
                            self.win = true
                            
                            //update backgrounds to green
                            for i in 0...2 {
                                self.backgrounds1[i] = Color.green
                            }
                        }
                        
                        //check winnings row 2
                        if (numbers2[0] == numbers2[1]) && (numbers2[1] == numbers2[2]) {
                            //won
                            self.credits += bet*5
                            self.win = true
                            
                            //update backgrounds to green
                            for i in 0...2 {
                                self.backgrounds2[i] = Color.green
                            }
                        }
                        
                        if credits > HS {
                            HS = credits
                            self.HSCheck = true
                        }
                        
                    }) {
                        Text("Spin")
                            .bold()
                                .foregroundColor(.white)
                                .padding(.all, 10)
                                .padding(.horizontal, 10)
                                .background(Color.pink)
                                .cornerRadius(20)
                    }

                    
                    Spacer()
                    
                    
                    Button(action: {
                        // win to false
                        self.win = false
                        self.HSCheck = false
                        
                        // substract bets
                        self.credits = credits-superBet
                        
                        //set colors back to white
                        for i in 0...2 {
                            self.backgrounds[i] = Color.white
                            self.backgrounds1[i] = Color.white
                            self.backgrounds2[i] = Color.white
                        }
                        
                        // change images :
                        for i in 0...2 {
                            self.numbers[i] = Int.random(in: 0...self.symbols.count-1)
                            self.numbers1[i] = Int.random(in: 0...self.symbols.count-1)
                            self.numbers2[i] = Int.random(in: 0...self.symbols.count-1)
                        }
                        print(numbers2[0],numbers2[1],numbers2[2])
                        
                        //check winnings row 0
                        if (numbers[0] == numbers [1]) && (numbers[1] == numbers[2]) {
                            //won
                            self.credits += superBet*5
                            self.win = true
                            
                            //update backgrounds to green
                            for i in 0...2 {
                                self.backgrounds[i] = Color.green
                            }
                        }
                        
                        //check winnings row 1
                        if (numbers1[0] == numbers1 [1]) && (numbers1[1] == numbers1[2]) {
                            //won
                            self.credits += superBet*4
                            self.win = true
                            
                            //update backgrounds to green
                            for i in 0...2 {
                                self.backgrounds1[i] = Color.green
                            }
                        }
                        
                        //check winnings row 2
                        if (numbers2[0] == numbers2[1]) && (numbers2[1] == numbers2[2]) {
                            //won
                            self.credits += superBet*4
                            self.win = true
                            
                            //update backgrounds to green
                            for i in 0...2 {
                                self.backgrounds2[i] = Color.green
                            }
                        }
                        
                        //check winnigs diagonal 1
                        if (numbers[0]==numbers1[1]) && (numbers1[1]==numbers2[2]) {
                            //won
                            self.credits += superBet*4
                            self.win = true
                            
                            //update backgrounds to green
                            self.backgrounds[0] = Color.green
                            self.backgrounds1[1] = Color.green
                            self.backgrounds2[2] = Color.green
                        }
                        
                        //check winnigs diagonal 2
                        if (numbers2[0]==numbers1[1]) && (numbers1[1]==numbers[2]) {
                            //won
                            self.credits += superBet*4
                            self.win = true
                            //update backgrounds to green
                            self.backgrounds2[0] = Color.green
                            self.backgrounds1[1] = Color.green
                            self.backgrounds[2] = Color.green
                        }

                        if credits > HS {
                            HS = credits
                            self.HSCheck = true
                        }
                        
                    }) {
                        Text("Super Spin")
                            .bold()
                                .foregroundColor(.white)
                                .padding(.all, 10)
                                .padding(.horizontal, 10)
                                .background(Color.pink)
                                .cornerRadius(20)
                    }
                    Spacer()
                }
                Spacer()
            }
        }
        .animation(.easeOut)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
