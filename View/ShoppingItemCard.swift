//
//  ShoppingItemCard.swift
//  DeliveryApp-PullToRefresh
//
//  Created by Shreyas Vilaschandra Bhike on 08/05/24.
//

import SwiftUI


struct ShoppingItemCard: View {
    let showShimmer: Bool
    let itemNumber : Int
    let colors: [Color] = [.red, .green, .blue, .yellow, .purple]
    
       var body: some View {
           let randomColor = colors.randomElement() ?? .orange
       
            HStack {
                RoundedRectangle(cornerRadius: 15)
                    .foregroundStyle(randomColor).opacity(0.6)
                    .frame(width: 100,height: 100)
                    .padding(10)
                Spacer()
                VStack{
                    HStack{
                        Text("Item \(itemNumber)")
                            .font(.title2)
                            .fontWeight(.regular)
                            .padding(.top, 10)
                            .opacity(0.8)
                        
                        Spacer()
                        
                    }
                    
                    HStack{
                        Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry.")
                            .font(.subheadline)
                            .opacity(0.4)
                            
                        
                        Spacer()
                    }
                    Spacer()
                }
                Spacer()
            }
            .frame(width: 360)
            .background(
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(Color.black, lineWidth: 1.5).opacity(1)
                            .background(Color.white)
                    )
            .padding(5)
        }
    }


