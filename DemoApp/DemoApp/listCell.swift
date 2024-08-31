//
//  listCell.swift
//  DemoApp
//
//  Created by Saif on 30/08/2024.
//

import SwiftUI

struct ListCell: View {
  let listing: Model

    var body: some View {
        HStack {
            AsyncImage(url: URL(string: listing.image_urls?.first ?? "")) { phase in  // Use phase instead of image
                switch phase {
                case .success(let image):
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 100, height: 100)
                case .failure(_):
                    Image(systemName: "photo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 100, height: 100)
                case .empty:
                    ProgressView()
                        .frame(width: 100, height: 100)
                @unknown default:
                    EmptyView()
                }
            }
            .padding()

            VStack(alignment: .leading) {
                Text(listing.name ?? "")
                    .font(.headline)

                Text(listing.price ?? "")
                    .font(.subheadline)
            }
        }
    }

}
