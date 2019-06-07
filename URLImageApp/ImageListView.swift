//
//  ImageListView.swift
//  URLImageApp
//
//  Created by Dmytro Anokhin on 07/06/2019.
//  Copyright © 2019 Dmytro Anokhin. All rights reserved.
//

import SwiftUI


struct ImageListView : View {

    let urls = (300..<325).map { "https://picsum.photos/\($0)" }.map { URL(string: $0)! }

    var body: some View {
        NavigationView {
            List(urls.identified(by: \.self)) { url in
                NavigationButton(destination: ImageDetailView(url: url)) {
                    HStack {
                        URLImage(url: url)
                            .frame(minWidth: 100.0, maxWidth: 100.0, minHeight: 100.0, maxHeight: 100.0)
                            .clipped()
                        Text("\(url)")
                    }
                }
            }
            .navigationBarTitle(Text("Images"))
        }
    }
}

#if DEBUG
struct ImageListView_Previews : PreviewProvider {
    static var previews: some View {
        ImageListView()
    }
}
#endif
