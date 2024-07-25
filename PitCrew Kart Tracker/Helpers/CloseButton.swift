//
//  CloseButton.swift
//  PitCrew Kart Tracker
//
//  Created by Николай Щербаков on 24.07.2024.
//

import SwiftUI

struct CloseButton: View {
    
    let action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            Image(systemName: "xmark")
                .resizable()
                .scaledToFit()
                .foregroundColorCustom(.black)
                .padding(10)
                .background(Color.appSecondary)
                .clipShape(.circle)
                .frame(width: 30, height: 30)
        }
    }
}

#Preview {
    CloseButton() {
        
    }
}
