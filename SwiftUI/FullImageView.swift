/*
See LICENSE folder for this sample’s licensing information.

Abstract:
A SwiftUI view that shows a scrollable full-size image.
*/

import SwiftUI
import CoreData

struct FullImageView: View {
    @Binding var activeCover: ActiveCover?
    var photo: Photo
    
    private var photoImage: UIImage? {
        let photoData = photo.photoData?.data
        return photoData != nil ? UIImage(data: photoData!) : nil
    }

    var body: some View {
        NavigationView {
            VStack {
                if let image = photoImage {
                    ScrollView([.horizontal, .vertical]) {
                        Image(uiImage: image)
                    }
                } else {
                    Text("The full size image is probably not downloaded from CloudKit.").padding()
                    Spacer()
                }
            }
            .toolbar {
                ToolbarItem(placement: .automatic) {
                    Button("Dismiss") { activeCover = nil }
                }
            }
            .listStyle(.plain)
            .navigationTitle("Full Size Photo")
        }
    }
}
