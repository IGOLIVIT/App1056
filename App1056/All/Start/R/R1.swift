//
//  R1.swift
//  App1056
//
//  Created by IGOR on 12/11/2024.
//

import SwiftUI

struct R1: View {
    var body: some View {

        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            VStack {
                
                Image("R1")
                    .resizable()
                    .ignoresSafeArea()
            }
            
            VStack {
                
                Spacer()
                
                VStack {
                    
                    Text("Simple and user-friendly")
                        .foregroundColor(.white)
                        .font(.system(size: 32, weight: .bold))
                        .multilineTextAlignment(.center)
                    
                    Spacer()
                    
                    HStack {
                        
                        HStack {
                            
                            Circle()
                                .fill(Color("prim"))
                                .frame(width: 10)
                            
                            Circle()
                                .fill(Color.gray)
                                .frame(width: 10)
                            
                        }
                        .frame(maxWidth: .infinity)
                        
                        NavigationLink(destination: {
                            
                            R2()
                                .navigationBarBackButtonHidden()
                            
                        }, label: {
                            
                            Text("Next")
                                .foregroundColor(.white)
                                .font(.system(size: 15, weight: .regular))
                                .frame(width: 160, height: 50)
                                .background(RoundedRectangle(cornerRadius: 15).fill(Color("prim")))
                        })
                    }
                }
                .padding()
                .padding(.vertical)
                .frame(maxWidth: .infinity)
                .frame(height: 250)
                .background(RoundedRectangle(cornerRadius: 20).fill(.black))
            }
            .ignoresSafeArea()
        }
    }
}

#Preview {
    R1()
}
