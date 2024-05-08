//
//  ContentView.swift
//  DeliveryApp-PullToRefresh
//
//  Created by Shreyas Vilaschandra Bhike on 08/05/24.
//

//  MARK: Instagram
//  TheAppWizard
//  MARK: theappwizard2408
//  Animation(Dribble)
//  Truck Delivery By
//  Tepi Kuncoro

import SwiftUI

struct ContentView : View {
    var body: some View {
        MainView()
    }
}



#Preview {
    ContentView()
}











struct MainView: View {
    @Environment(\.refresh) private var refresh
    @State private var isCurrentlyRefreshing = false
    let amountToPullBeforeRefreshing: CGFloat = 150

    let images: [UIImage]
       
    init() {
        var dynamicImages = [UIImage]()
        for i in 1...204 {
            if let image = UIImage(named: "image\(i)") {
                dynamicImages.append(image)
            }
        }
        self.images = dynamicImages
     }
    
   
    
    var body: some View {
        ScrollView {
            if isCurrentlyRefreshing {
                AnimationSequence(images: images)
                    .frame(height: 360)
                    .transition(.opacity) // Added animation
            }
            
            LazyVGrid(columns: [GridItem(.flexible())]) {
                ForEach(0...5, id: \.self) { index in
                    ShoppingItemCard(showShimmer: isCurrentlyRefreshing,itemNumber: index)
                }
            }
            .overlay(GeometryReader { geo in
                let currentScrollViewPosition = -geo.frame(in: .global).origin.y
                
                if currentScrollViewPosition < -amountToPullBeforeRefreshing && !isCurrentlyRefreshing {
                    Color.clear.preference(key: ViewOffsetKey.self, value: -geo.frame(in: .global).origin.y)
                }
            })
        }
        .onPreferenceChange(ViewOffsetKey.self) { scrollPosition in
            if scrollPosition < -amountToPullBeforeRefreshing && !isCurrentlyRefreshing {
                isCurrentlyRefreshing = true
                Task {
                    await refreshData()
                    await MainActor.run {
                        withAnimation {
                            isCurrentlyRefreshing = false
                        }
                    }
                }
            }
        }
    }
    
    
    func refreshData() async {
        try? await Task.sleep(nanoseconds: 5_000_000_000)
    }
}


struct ViewOffsetKey: PreferenceKey {
    static var defaultValue: CGFloat = 0
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value += nextValue()
    }
}
