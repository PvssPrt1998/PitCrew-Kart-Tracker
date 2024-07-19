

import SwiftUI

struct KartCollectionViewCell: View {
    
    let kart: Kart
    
    private let width: CGFloat = 161
    
    var body: some View {
        VStack(spacing: 8) {
            setImage()
                .resizable()
                .scaledToFit()
                .frame(maxWidth: .infinity, maxHeight: 140)
                .background(Color.white)
                .clipShape(.rect(cornerRadius: 8))
            VStack(spacing: 16) {
                TextCustom(text: kart.title, size: 15, weight: .semibold, color: .white)
                    .frame(maxWidth: .infinity, alignment: .leading)
                VStack(spacing: 8) {
                    HStack {
                        TextCustom(text: "Quantity", size: 12, weight: .regular, color: .textTertiary)
                        Spacer()
                        TextCustom(text: "\(kart.quantity)", size: 12, weight: .regular, color: .white)
                    }
                    HStack {
                        TextCustom(text: "Maximum speed", size: 12, weight: .regular, color: .textTertiary)
                        Spacer()
                        TextCustom(text: "\(kart.maxSpeed) km/h.", size: 12, weight: .regular, color: .white)
                    }
                }
            }.padding(.horizontal, 6)
           
        }
        .padding(EdgeInsets(top: 6, leading: 6, bottom: 12, trailing: 6))
        .background(Color.bgLight)
        .clipShape(.rect(cornerRadius: 12))
    }
    
    func setImage() -> Image {
        guard let image = UIImage(data: kart.pic) else { return Image(systemName: "car") }
        return Image(uiImage: image)
    }
}

#Preview {
    KartCollectionViewCell(kart: Kart(pic: Data(), title: "title1", quantity: 8, maxSpeed: 30))
        .background(Color.bgMain)
}

