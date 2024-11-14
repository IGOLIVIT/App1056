//
//  RulesView.swift
//  App1056
//
//  Created by IGOR on 12/11/2024.
//

import SwiftUI

struct RulesView: View {

    @StateObject var viewModel = RulesViewModel()
    
    var body: some View {

        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            VStack {
                
                HStack {
                    
                    Text("Rules")
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
                
                if viewModel.rules.isEmpty {
                    
                    VStack(spacing: 8) {
                        
                        Image("rocket")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 150)
                        
                        Text("Empty")
                            .foregroundColor(.white)
                            .font(.system(size: 26, weight: .bold))
                        
                        Text("You haven't added any rules")
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
                        
                        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], content: {
                            
                            ForEach(viewModel.rules, id: \.self) { index in
                                
                                Button(action: {
                                    
                                    viewModel.selectedRule = index
                                    
                                    withAnimation(.spring()) {
                                        
                                        viewModel.isDetail = true
                                    }
                                    
                                }, label: {
                                    
                                    VStack(alignment: .leading) {
                                        
                                        Image(systemName: "arrow.up.right")
                                            .foregroundColor(.white)
                                            .font(.system(size: 18, weight: .medium))
                                        
                                        Spacer()
                                        
                                        Text(index.ruName ?? "")
                                            .foregroundColor(.white)
                                            .font(.system(size: 18, weight: .medium))
                                    }
                                    .padding()
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .frame(height: 150)
                                    .background(RoundedRectangle(cornerRadius: 20).fill(Color("bg2")))
                                })
                            }
                        })
                    }
                }
            }
            .padding()
        }
        .onAppear {
            
            viewModel.fetchRules()
        }
        .sheet(isPresented: $viewModel.isAdd, content: {
            
            AddRules(viewModel: viewModel)
        })
        .sheet(isPresented: $viewModel.isDetail, content: {
            
            RulesDetail(viewModel: viewModel)
        })
    }
}

#Preview {
    RulesView()
}
