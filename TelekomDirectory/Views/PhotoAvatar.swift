import SwiftUI

struct PhotoAvatar: View {
    var imageURL: URL?

    var size: CGFloat = 60

    var body: some View {
        AsyncImage(url: imageURL) { image in
            image
                .resizable()
                .scaledToFill()
                .clipShape(Circle())
        } placeholder: {
            Image(systemName: "person.circle.fill")
                .resizable()
                .scaledToFill()
                .foregroundColor(.gray)
        }
        .frame(width: size, height: size)
        .clipped()
    }
}

#Preview {
    VStack {
        PhotoAvatar(imageURL: URL(string:
            """
            https://images.pexels.com/photos/28186055/pexels-photo-28186055/free-photo-of-a-man-and-woman-sitting-on-a-couch-together.jpeg
            """
        ))

        PhotoAvatar(imageURL: nil, size: 200)
    }
}
