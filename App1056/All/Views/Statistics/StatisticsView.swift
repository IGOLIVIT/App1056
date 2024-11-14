//
//  StatisticsView.swift
//  App1056
//
//  Created by IGOR on 12/11/2024.
//

import SwiftUI

struct StatisticsView: View {

    @StateObject var viewModel = StatisticsViewModel()
    
    var body: some View {

        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            VStack {
                
                HStack {
                    
                    Text("Statistics")
                        .foregroundColor(.white)
                        .font(.system(size: 30, weight: .bold))
                    
                    Spacer()
                    
                    Button(action: {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isAdd = true
                        }
                        
                    }, label: {
                        
                        Image(systemName: "plus")
                            .foregroundColor(.white)
                            .font(.system(size: 17, weight: .medium))
                            .padding(10)
                            .background(Circle().fill(Color("prim")))
                    })
                }
                .padding(.bottom, 20)
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    VStack {
                        
                        VStack {
                            
                            Text("\(viewModel.AverPoints)")
                                .foregroundColor(.white)
                                .font(.system(size: 24, weight: .bold))
                            
                            Text("Average points per match")
                                .foregroundColor(.gray)
                                .font(.system(size: 13, weight: .regular))
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .frame(height: 100)
                        .background(RoundedRectangle(cornerRadius: 20).fill(.white.opacity(0.07)))
                        
                        HStack {
                            
                            VStack {
                                
                                Text("\(viewModel.WinPerc)")
                                    .foregroundColor(.white)
                                    .font(.system(size: 24, weight: .bold))
                                
                                Text("Win percentage")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 13, weight: .regular))
                            }
                            .padding()
                            .frame(maxWidth: .infinity)
                            .frame(height: 204)
                            .background(RoundedRectangle(cornerRadius: 20).fill(.white.opacity(0.07)))
                            
                            VStack {
                                
                                VStack {
                                    
                                    Text("\(viewModel.NumWins)")
                                        .foregroundColor(.white)
                                        .font(.system(size: 24, weight: .bold))
                                    
                                    Text("Number of wins")
                                        .foregroundColor(.gray)
                                        .font(.system(size: 13, weight: .regular))
                                }
                                .padding()
                                .frame(maxWidth: .infinity)
                                .frame(height: 100)
                                .background(RoundedRectangle(cornerRadius: 20).fill(.white.opacity(0.07)))
                                
                                VStack {
                                    
                                    Text("\(viewModel.NumGames)")
                                        .foregroundColor(.white)
                                        .font(.system(size: 24, weight: .bold))
                                    
                                    Text("Number of games played")
                                        .foregroundColor(.gray)
                                        .font(.system(size: 13, weight: .regular))
                                }
                                .padding()
                                .frame(maxWidth: .infinity)
                                .frame(height: 100)
                                .background(RoundedRectangle(cornerRadius: 20).fill(.white.opacity(0.07)))
                            }
                        }
                        
                        HStack {
                            
                            VStack {
                                
                                Text("\(viewModel.numWon)")
                                    .foregroundColor(.white)
                                    .font(.system(size: 24, weight: .bold))
                                
                                Text("Number of sets won")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 13, weight: .regular))
                                    .multilineTextAlignment(.center)

                            }
                            .padding()
                            .frame(maxWidth: .infinity)
                            .frame(height: 100)
                            .background(RoundedRectangle(cornerRadius: 20).fill(.white.opacity(0.07)))
                            
                            VStack {
                                
                                Text("\(viewModel.numAces)")
                                    .foregroundColor(.white)
                                    .font(.system(size: 24, weight: .bold))
                                
                                Text("Number of Aces")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 13, weight: .regular))
                                    .multilineTextAlignment(.center)

                            }
                            .padding()
                            .frame(maxWidth: .infinity)
                            .frame(height: 100)
                            .background(RoundedRectangle(cornerRadius: 20).fill(.white.opacity(0.07)))
                            
                            VStack {
                                
                                Text("\(viewModel.mDur)")
                                    .foregroundColor(.white)
                                    .font(.system(size: 24, weight: .bold))
                                
                                Text("Average match duration")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 13, weight: .regular))
                                    .multilineTextAlignment(.center)

                            }
                            .padding()
                            .frame(maxWidth: .infinity)
                            .frame(height: 100)
                            .background(RoundedRectangle(cornerRadius: 20).fill(.white.opacity(0.07)))
                            
                        }
                        
                        HStack {
                            
                            VStack {
                                
                                Text("\(viewModel.percServ)")
                                    .foregroundColor(.white)
                                    .font(.system(size: 24, weight: .bold))
                                
                                Text("Percentage of successful serves")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 13, weight: .regular))
                                    .multilineTextAlignment(.center)
                            }
                            .padding()
                            .frame(maxWidth: .infinity)
                            .frame(height: 100)
                            .background(RoundedRectangle(cornerRadius: 20).fill(.white.opacity(0.07)))
                            
                            VStack {
                                
                                Text("\(viewModel.numDFaults)")
                                    .foregroundColor(.white)
                                    .font(.system(size: 24, weight: .bold))
                                
                                Text("Number of double faults")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 13, weight: .regular))
                                    .multilineTextAlignment(.center)

                            }
                            .padding()
                            .frame(maxWidth: .infinity)
                            .frame(height: 100)
                            .background(RoundedRectangle(cornerRadius: 20).fill(.white.opacity(0.07)))
                        }
                    }
                }
            }
            .padding()
        }
        .overlay(
            
            ZStack {
                
                Color.black.opacity(viewModel.isAdd ? 0.5 : 0)
                    .ignoresSafeArea()
                    .onTapGesture {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isAdd = false
                        }
                    }
                
                VStack {
                    
                    HStack {
                        
                        Spacer()
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isAdd = false
                            }
                            
                        }, label: {
                            
                            Image(systemName: "xmark")
                                .foregroundColor(.black)
                                .font(.system(size: 15, weight: .regular))
                        })
                    }
                    
                    Text("Add statistics")
                        .foregroundColor(.white)
                        .font(.system(size: 20, weight: .semibold))
                        .padding()
                    
                    ZStack(content: {
                        
                        Text("Average points per match")
                            .foregroundColor(.gray)
                            .font(.system(size: 15, weight: .regular))
                            .opacity(viewModel.addAverPoints.isEmpty ? 1 : 0)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        TextField("", text: $viewModel.addAverPoints)
                            .foregroundColor(Color.white)
                            .font(.system(size: 15, weight: .medium))
                        
                    })
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(RoundedRectangle(cornerRadius: 15).fill(Color.white.opacity(0.1)))
                    
                    ZStack(content: {
                        
                        Text("Win percentage")
                            .foregroundColor(.gray)
                            .font(.system(size: 15, weight: .regular))
                            .opacity(viewModel.addWinPerc.isEmpty ? 1 : 0)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        TextField("", text: $viewModel.addWinPerc)
                            .foregroundColor(Color.white)
                            .font(.system(size: 15, weight: .medium))
                        
                    })
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(RoundedRectangle(cornerRadius: 15).fill(Color.white.opacity(0.1)))
                    
                    ZStack(content: {
                        
                        Text("Number of wins")
                            .foregroundColor(.gray)
                            .font(.system(size: 15, weight: .regular))
                            .opacity(viewModel.addNumWins.isEmpty ? 1 : 0)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        TextField("", text: $viewModel.addNumWins)
                            .foregroundColor(Color.white)
                            .font(.system(size: 15, weight: .medium))
                        
                    })
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(RoundedRectangle(cornerRadius: 15).fill(Color.white.opacity(0.1)))
                    
                    ZStack(content: {
                        
                        Text("Number of games played")
                            .foregroundColor(.gray)
                            .font(.system(size: 15, weight: .regular))
                            .opacity(viewModel.addNumGames.isEmpty ? 1 : 0)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        TextField("", text: $viewModel.addNumGames)
                            .foregroundColor(Color.white)
                            .font(.system(size: 15, weight: .medium))
                        
                    })
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(RoundedRectangle(cornerRadius: 15).fill(Color.white.opacity(0.1)))
                    
                    ZStack(content: {
                        
                        Text("Number of sets won")
                            .foregroundColor(.gray)
                            .font(.system(size: 15, weight: .regular))
                            .opacity(viewModel.addnumWon.isEmpty ? 1 : 0)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        TextField("", text: $viewModel.addnumWon)
                            .foregroundColor(Color.white)
                            .font(.system(size: 15, weight: .medium))
                        
                    })
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(RoundedRectangle(cornerRadius: 15).fill(Color.white.opacity(0.1)))
                    
                    ZStack(content: {
                        
                        Text("Number of Aces")
                            .foregroundColor(.gray)
                            .font(.system(size: 15, weight: .regular))
                            .opacity(viewModel.addnumAces.isEmpty ? 1 : 0)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        TextField("", text: $viewModel.addnumAces)
                            .foregroundColor(Color.white)
                            .font(.system(size: 15, weight: .medium))
                        
                    })
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(RoundedRectangle(cornerRadius: 15).fill(Color.white.opacity(0.1)))
                    
                    ZStack(content: {
                        
                        Text("Average match duration")
                            .foregroundColor(.gray)
                            .font(.system(size: 15, weight: .regular))
                            .opacity(viewModel.addmDur.isEmpty ? 1 : 0)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        TextField("", text: $viewModel.addmDur)
                            .foregroundColor(Color.white)
                            .font(.system(size: 15, weight: .medium))
                        
                    })
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(RoundedRectangle(cornerRadius: 15).fill(Color.white.opacity(0.1)))
                    
                    ZStack(content: {
                        
                        Text("Percentage of successful serves")
                            .foregroundColor(.gray)
                            .font(.system(size: 15, weight: .regular))
                            .opacity(viewModel.addpercServ.isEmpty ? 1 : 0)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        TextField("", text: $viewModel.addpercServ)
                            .foregroundColor(Color.white)
                            .font(.system(size: 15, weight: .medium))
                        
                    })
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(RoundedRectangle(cornerRadius: 15).fill(Color.white.opacity(0.1)))
                    
                    ZStack(content: {
                        
                        Text("Number of double faults")
                            .foregroundColor(.gray)
                            .font(.system(size: 15, weight: .regular))
                            .opacity(viewModel.addnumDFaults.isEmpty ? 1 : 0)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        TextField("", text: $viewModel.addnumDFaults)
                            .foregroundColor(Color.white)
                            .font(.system(size: 15, weight: .medium))
                        
                    })
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(RoundedRectangle(cornerRadius: 15).fill(Color.white.opacity(0.1)))
                    .padding(.bottom)
                    
                    HStack {
                        
                        Button(action: {
                            
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isAdd = false
                            }
                            
                        }, label: {
                            
                            Text("Cancel")
                                .foregroundColor(Color("prim"))
                                .font(.system(size: 15, weight: .regular))
                                .frame(maxWidth: .infinity)
                                .frame(height: 50)
                        })
                        
                        Button(action: {

                            viewModel.AverPoints.append(viewModel.addAverPoints)
                            viewModel.WinPerc.append(viewModel.addWinPerc)
                            viewModel.NumWins.append(viewModel.addNumWins)
                            viewModel.NumGames.append(viewModel.addNumGames)
                            viewModel.numWon.append(viewModel.addnumWon)
                            viewModel.numAces.append(viewModel.addnumAces)
                            viewModel.mDur.append(viewModel.addmDur)
                            viewModel.percServ.append(viewModel.addpercServ)
                            viewModel.numDFaults.append(viewModel.addnumDFaults)

                            withAnimation(.spring()) {
                                
                                viewModel.isAdd = false
                            }
                            
                        }, label: {
                            
                            Text("Add")
                                .foregroundColor(Color("prim"))
                                .font(.system(size: 17, weight: .medium))
                                .frame(maxWidth: .infinity)
                                .frame(height: 50)
                        })
                        
                    }
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(RoundedRectangle(cornerRadius: 20).fill(Color("bg2")))
                .offset(y: viewModel.isAdd ? 0 : UIScreen.main.bounds.height)
                .frame(maxHeight: .infinity, alignment: .bottom)
            }
        )
    }
}

#Preview {
    StatisticsView()
}
