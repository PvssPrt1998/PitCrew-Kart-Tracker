import SwiftUI

struct AddItemImage: View {
   
    @Binding var imageData: Data?
    @State var image: Image?
    @State private var showingImagePicker = false
    @State private var inputImage: UIImage?
    
    var body: some View {
        ZStack {
            Color.imagePlaceholder
            if let image = image {
                ZStack {
                    Color.white
                    image
                        .resizable()
                        .scaledToFit()
                }
            }
            Image(systemName: "photo")
                .frame(width: 32, height: 32)
                .foregroundColorCustom(.white)
        }
        .frame(width: 160, height: 140)
        .clipShape(.rect(cornerRadius: 12))
        .onTapGesture {
            showingImagePicker = true
        }
        .onChange(of: inputImage) { _ in
            loadImage()
        }
        .sheet(isPresented: $showingImagePicker) {
            ImagePicker(image: $inputImage)
                .ignoresSafeArea()
        }
    }
    
    func loadImage() {
        guard let inputImage = inputImage else { return }
        image = Image(uiImage: inputImage)
        imageData = inputImage.pngData()
    }
}

