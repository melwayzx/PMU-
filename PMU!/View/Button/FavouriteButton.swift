//
//  FavouriteButton.swift
//  PMU!
//
//  Created by Melwayz's  on 8/2/21.
//

import SwiftUI

struct FavoriteButton: View {
    @Binding var isSet: Bool

    var body: some View {
        Button(action: {
            isSet.toggle()
        }) {
            Image(systemName: isSet ? "heart.fill" : "heart")
                .foregroundColor(isSet ? Color.red : Color.red)
        }
    }
}

struct FavoriteButton_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteButton(isSet: .constant(false))
    }
}
