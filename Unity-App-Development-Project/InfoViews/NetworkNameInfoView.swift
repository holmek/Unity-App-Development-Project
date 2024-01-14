//
//  BroadcastInfoView.swift
//  BITIFY
//
//  Created by Holm on 16/11/2023.
//

import Foundation
import SwiftUI

struct NetworkNameInfoView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("SSID")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            Text("A Service Set Identifier (SSID) is a fundamental aspect of wireless networking, serving as the unique name that identifies a wireless local area network (WLAN). The SSID is crucial for connecting devices to the correct network and plays a key role in wireless network administration.")
                .font(.body)
            
            Text("Role in Wireless Network Identification")
                .font(.title)
                .fontWeight(.bold)
            
            Text("The SSID is essential for distinguishing one WLAN from another. When connecting a device to a wireless network, users select the specific SSID associated with the network. This identifier ensures that devices connect to the intended network, preventing interference and unauthorized access.")
                .font(.body)
            
            Text("Security Considerations and SSID")
                .font(.title)
                .fontWeight(.bold)
            
            Text("In wireless network security, concealing the SSID is a common practice to enhance privacy and prevent unauthorized access. While this doesn't provide robust security on its own, it adds an additional layer of complexity for potential intruders.")
                .font(.body)
            
            Text("Configuration and Administration")
                .font(.title)
                .fontWeight(.bold)
            
            Text("Network administrators configure and manage SSIDs to optimize wireless network performance. This includes setting up multiple SSIDs on a single access point for segmentation or adjusting the broadcast settings to balance network visibility and security.")
                .font(.body)
        }
        .padding()
        .frame(width: 400)
        .fontWeight(.semibold)
    }
}
