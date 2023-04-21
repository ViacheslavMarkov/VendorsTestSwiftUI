//
//  SVGKFastImageViewSUI.swift
//  VendorsTestSwiftUI
//
//  Created by Viacheslav Markov on 20.04.2023.
//

import SwiftUI
import SVGKit

struct SVGKFastImageViewSUI: UIViewRepresentable {
    var url: URL?
    var size: CGSize
    
    func makeUIView(context: Context) -> SVGKFastImageView {
        let svgImage = SVGKImage(contentsOf: url)
        return SVGKFastImageView(svgkImage: svgImage ?? SVGKImage())
    }
    
    func updateUIView(_ uiView: SVGKFastImageView, context: Context) {
        uiView.image = SVGKImage(contentsOf: url)
        uiView.image.size = size
    }
}

struct SVGImage_Previews: PreviewProvider {
    static var previews: some View {
        SVGKFastImageViewSUI(
            url: URL(string: "https://media-staging.chatsumer.app/48/1830f855-6315-4d3c-a5dc-088ea826aef2.svg")!,
            size: CGSize(width: 32, height: 32)
        )
        .previewLayout(.fixed(width: 32, height: 32))
    }
}
