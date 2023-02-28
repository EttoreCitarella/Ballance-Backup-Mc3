//
//  Tray.swift
//  Bal(l)ance
//
//  Created by Ettore Developer on 27/02/23.
//

import SwiftUI

struct Tray: View {
    var body: some View {
        ZStack{
            Circle()
                .frame(width: 380.0, height: 380.0)
                .foregroundColor(.gray.opacity(0.7))
            
            Circle()
                .frame(width: 350.0, height: 350.0)
                .foregroundColor(.green.opacity(0.7))
        }
    }
}

struct Tray_Previews: PreviewProvider {
    static var previews: some View {
        Tray()
    }
}
