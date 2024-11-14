//
//  PlayingView.swift
//  App1056
//
//  Created by IGOR on 12/11/2024.
//

import SwiftUI

struct PlayingView: View {
    
    @StateObject var viewModel = PlayingViewModel()
    
    var body: some View {
        
        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            VStack {
                
                HStack {
                    
                    Text("Playing technique")
                        .foregroundColor(.white)
                        .font(.system(size: 30, weight: .bold))
                    
                    Spacer()
                    
                    Button(action: {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isCat = true
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
                
                if viewModel.categories.isEmpty {
                    
                    VStack(spacing: 8) {
                        
                        Image("rocket")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 150)
                        
                        Text("Empty")
                            .foregroundColor(.white)
                            .font(.system(size: 26, weight: .bold))
                        
                        Text("You haven't added any playing technique")
                            .foregroundColor(.gray)
                            .font(.system(size: 16, weight: .regular))
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .frame(height: 240)
                    .background(RoundedRectangle(cornerRadius: 20).fill(Color("bg2").opacity(0.4)))
                    
                    Spacer()
                    
                } else {
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        
                        VStack {
                            
                            ForEach(viewModel.categories, id: \.self) { indexer in
                                
                                VStack {
                                    
                                    HStack {
                                        
                                        Text(indexer)
                                            .foregroundColor(.white)
                                            .font(.system(size: 17, weight: .medium))
                                        
                                        Spacer()
                                        
                                        Button(action: {
                                            
                                            viewModel.currCateg = indexer
                                            
                                            withAnimation(.spring()) {
                                                
                                                viewModel.isAdd = true
                                            }
                                            
                                        }, label: {
                                            
                                            Image(systemName: "plus")
                                                .foregroundColor(.white)
                                                .font(.system(size: 18, weight: .medium))
                                        })
                                    }
                                    
                                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], content: {
                                        
                                        ForEach(viewModel.playings.filter{($0.plCat ?? "") == indexer}, id: \.self) { index in
                                            
                                            Button(action: {
                                                
                                                viewModel.selectedPlay = index
                                                
                                                withAnimation(.spring()) {
                                                    
                                                    viewModel.isDetail = true
                                                }
                                                
                                            }, label: {
                                                
                                                Text(index.plName ?? "")
                                                    .foregroundColor(.white)
                                                    .font(.system(size: 28, weight: .bold))
                                                    .frame(maxWidth: .infinity)
                                                    .frame(height: 100)
                                                    .background(RoundedRectangle(cornerRadius: 15).fill(.white.opacity(0.05)))
                                            })
                                        }
                                    })
                                }
                            }
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(RoundedRectangle(cornerRadius: 20).fill(.white.opacity(0.07)))
                        }
                    }
                }
            }
            .padding()
        }
        .overlay(
            
            ZStack {
                
                Color.black.opacity(viewModel.isCat ? 0.5 : 0)
                    .ignoresSafeArea()
                    .onTapGesture {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isCat = false
                        }
                    }
                
                VStack {
                    
                    HStack {
                        
                        Spacer()
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isCat = false
                            }
                            
                        }, label: {
                            
                            Image(systemName: "xmark")
                                .foregroundColor(.black)
                                .font(.system(size: 15, weight: .regular))
                        })
                    }
                    
                    Text("Add category of technique")
                        .foregroundColor(.white)
                        .font(.system(size: 20, weight: .semibold))
                        .padding()
                    
                    ZStack(content: {
                        
                        Text("Enter")
                            .foregroundColor(.gray)
                            .font(.system(size: 15, weight: .regular))
                            .opacity(viewModel.addCateg.isEmpty ? 1 : 0)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        TextField("", text: $viewModel.addCateg)
                            .foregroundColor(Color.white)
                            .font(.system(size: 15, weight: .medium))
                        
                    })
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(RoundedRectangle(cornerRadius: 15).fill(Color.white.opacity(0.1)))
                    .padding(.bottom)
                    
                    HStack {
                        
                        Button(action: {
                            
                            viewModel.addCateg = ""
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isCat = false
                            }
                            
                        }, label: {
                            
                            Text("Cancel")
                                .foregroundColor(Color("prim"))
                                .font(.system(size: 15, weight: .regular))
                                .frame(maxWidth: .infinity)
                                .frame(height: 50)
                        })
                        
                        Button(action: {
                            
                            viewModel.categories.append(viewModel.addCateg)
                            
                            viewModel.addCateg = ""
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isCat = false
                            }
                            
                        }, label: {
                            
                            Text("Add")
                                .foregroundColor(Color("prim"))
                                .font(.system(size: 17, weight: .medium))
                                .frame(maxWidth: .infinity)
                                .frame(height: 50)
                        })
                        .disabled(viewModel.addCateg.isEmpty ?  true : false)
                        
                    }
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(RoundedRectangle(cornerRadius: 20).fill(Color("bg2")))
                .offset(y: viewModel.isCat ? 0 : UIScreen.main.bounds.height)
                .frame(maxHeight: .infinity, alignment: .bottom)
                .ignoresSafeArea()
            }
        )
        .onAppear {
            
            viewModel.fetchPlays()
        }
        .sheet(isPresented: $viewModel.isAdd, content: {
            
            AddTech(viewModel: viewModel)
        })
        .sheet(isPresented: $viewModel.isDetail, content: {
            
            TechDetail(viewModel: viewModel)
        })
    }
}

#Preview {
    PlayingView()
}
