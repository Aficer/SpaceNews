//
//  NewsArticle.swift
//  SpaceNews
//
//  Created by Вадим Эфис on 29.04.2023.
//

import SwiftUI
import CachedAsyncImage

struct NewsArticle: View {
    let title : String
    let imageURL: String
    let siteName: String
    let summary: String
    var body: some View {
        VStack(alignment: .leading) {
            Text(siteName)
                .foregroundColor(.blue)
                .italic()
            
            HStack(alignment: .center) {
                CachedAsyncImage(url: URL(string: imageURL),
                                 transaction: Transaction(animation: .easeInOut)) { phase in
                    if let image = phase.image {
                        image
                            .resizable()
                            .scaledToFit()
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                    } else {
                      //Placeholder
                    }
                }
            }
            
            Text(title)
                .font(.headline)
                .padding(8)
            Text(summary)
                .lineLimit(6)
                .font(.body)
                .padding(8)
        }
        
    }
}

struct NewsArticle_Previews: PreviewProvider {
    static var previews: some View {
        NewsArticle(title: "Code Palace", imageURL: "...", siteName: "CodePalace YouTube", summary: "Check out Code Palace for more cool tutorials")
    }
}
