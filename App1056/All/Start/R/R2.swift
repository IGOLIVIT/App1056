//
//  R2.swift
//  App1056
//
//  Created by IGOR on 12/11/2024.
//

import SwiftUI

struct R2: View {
    
    @AppStorage("status") var status: Bool = false
    
    var body: some View {

        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            VStack {
                
                Image("R2")
                    .resizable()
                    .ignoresSafeArea()
            }
            
            VStack {
                
                Spacer()
                
                VStack {
                    
                    Text("Improve your mini-tennis game")
                        .foregroundColor(.white)
                        .font(.system(size: 32, weight: .bold))
                        .multilineTextAlignment(.center)
                    
                    Spacer()
                    
                    HStack {
                        
                        HStack {
                            
                            Circle()
                                .fill(Color.gray)
                                .frame(width: 10)
                            
                            Circle()
                                .fill(Color("prim"))
                                .frame(width: 10)

                            
                        }
                        .frame(maxWidth: .infinity)
                        
                        Button(action: {
                            
                            status = true
                            
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
    R2()
}
