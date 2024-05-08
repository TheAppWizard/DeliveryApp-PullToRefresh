//
//  AnimationSequence.swift
//  DeliveryApp-PullToRefresh
//
//  Created by Shreyas Vilaschandra Bhike on 08/05/24.
//

import SwiftUI

struct AnimationSequence: UIViewRepresentable {
    let images: [UIImage]
    
    func makeUIView(context: Context) -> UIView {
        let seqAnimview = UIView(frame: CGRect(x: 0, y: 0, width: 400, height: 400))
        let seqImage = UIImageView(frame: CGRect(x: 0, y: 0, width: 400, height: 400))
        seqImage.clipsToBounds = true
        seqImage.layer.cornerRadius = 20
        seqImage.autoresizesSubviews = true
        seqImage.contentMode = UIView.ContentMode.scaleAspectFill
        seqImage.image = UIImage.animatedImage(with: images, duration: 4)
        seqAnimview.addSubview(seqImage)
        return seqAnimview
    }
    
    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<AnimationSequence>) {
        
    }
}

