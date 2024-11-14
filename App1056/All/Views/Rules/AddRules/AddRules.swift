//
//  AddRules.swift
//  App1056
//
//  Created by IGOR on 12/11/2024.
//

import SwiftUI

struct AddRules: View {

    @StateObject var viewModel: RulesViewModel
    @Environment(\.presentationMode) var router
    
    var body: some View {

        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Text("Add rules")
                        .foregroundColor(.white)
                        .font(.system(size: 18, weight: .medium))
                    
                    HStack {
                        
                        Button(action: {
                            
                            
                            router.wrappedValue.dismiss()
                            
                        }, label: {
                            
                            Image(systemName: "chevron.left")
                                .foregroundColor(Color("prim"))
                                .font(.system(size: 17, weight: .medium))
                            
                            Text("Back")
                                .foregroundColor(Color("prim"))
                                .font(.system(size: 16, weight: .regular))
                        })
                        
                        Spacer()
                        
                    }
                }
                .padding(.bottom, 25)
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    VStack(spacing: 10) {
                        
                        Menu(content: {
                            
                            ForEach(viewModel.photos, id: \.self) { index in
                                
                                Button(action: {
                                    
                                    viewModel.currentPhoto = index
                                    
                                }, label: {
                                    
                                    Text(index)
                                })
                            }
                            
                        }, label: {
                            
                            if viewModel.currentPhoto.isEmpty {
                                
                                VStack(spacing: 15) {
                                    
                                    Image(systemName: "photo")
                                        .foregroundColor(.gray)
                                        .font(.system(size: 18, weight: .regular))
                                    
                                    Text("Add image")
                                        .foregroundColor(.gray)
                                        .font(.system(size: 15, weight: .regular))
                                }
                                .padding()
                                .frame(maxWidth: .infinity)
                                .frame(height: 250)
                                .background(RoundedRectangle(cornerRadius: 20).fill(.gray.opacity(0.4)))
                                
                            } else {
                                
                                Image(viewModel.currentPhoto)
                                    .resizable()
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 250)
                            }
                        })
                        .padding(.bottom)
                        
                        Text("Name")
                            .foregroundColor(.white)
                            .font(.system(size: 17, weight: .medium))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        ZStack(content: {
                            
                            Text("Enter")
                                .foregroundColor(.gray)
                                .font(.system(size: 14, weight: .regular))
                                .opacity(viewModel.ruName.isEmpty ? 1 : 0)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            TextField("", text: $viewModel.ruName)
                                .foregroundColor(Color.white)
                                .font(.system(size: 16, weight: .medium))
                            
                        })
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 15).fill(.gray.opacity(0.4)))
                        
                        Text("Text")
                            .foregroundColor(.white)
                            .font(.system(size: 17, weight: .medium))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        ZStack(content: {
                            
                            Text("Enter")
                                .foregroundColor(.gray)
                                .font(.system(size: 14, weight: .regular))
                                .opacity(viewModel.ruText.isEmpty ? 1 : 0)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            TextField("", text: $viewModel.ruText)
                                .foregroundColor(Color.white)
                                .font(.system(size: 16, weight: .medium))
                            
                        })
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 15).fill(.gray.opacity(0.4)))
                    }
                }
                
                Button(action: {
                    
                    viewModel.ruPhoto = viewModel.currentPhoto
                    
                    viewModel.addRule()
                    
                    viewModel.ruName = ""
                    viewModel.ruText = ""
                    viewModel.currentPhoto = ""
                    
                    viewModel.fetchRules()
                    
                    withAnimation(.spring()) {
                        
                        viewModel.isAdd = false
                    }
                    
                }, label: {
                    
                    Text("Save")
                        .foregroundColor(.white)
                        .font(.system(size: 15, weight: .regular))
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 15).fill(Color("prim")))
                })
                .opacity(viewModel.currentPhoto.isEmpty || viewModel.ruName.isEmpty || viewModel.ruText.isEmpty ? 0.5 : 1)
                .disabled(viewModel.currentPhoto.isEmpty || viewModel.ruName.isEmpty || viewModel.ruText.isEmpty ? true : false)
            }
            .padding()
        }
    }
}

#Preview {
    AddRules(viewModel: RulesViewModel())
}