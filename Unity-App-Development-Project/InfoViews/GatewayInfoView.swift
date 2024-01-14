//
//  BroadcastInfoView.swift
//  BITIFY
//
//  Created by Holm on 16/11/2023.
//

import Foundation
import SwiftUI

struct GatewayInfoView: View {
    var body: some View {
            VStack(alignment: .leading, spacing: 16) {
                Text("GATEWAY")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                Text("A network gateway is a crucial component that facilitates interconnectivity between disparate networks, enabling seamless communication and data exchange. This pivotal element serves as an entry point for data entering or leaving a network.")
                    .font(.body)
                
                Text("Role in Advanced Networking")
                    .font(.title)
                    .fontWeight(.bold)
                
                Text("In the realm of advanced networking, gateways play a pivotal role in orchestrating communication between networks with distinct protocols or infrastructures. They act as intelligent intermediaries, translating data formats and ensuring seamless interoperability.")
                    .font(.body)
                
                Text("Gateway Protocols and Functionality")
                    .font(.title)
                    .fontWeight(.bold)
                
                Text("Gateway functionality encompasses a spectrum of protocols and technologies. From routing protocols that determine the optimal path for data transmission to translation protocols that convert data formats, gateways are multifaceted. They are instrumental in maintaining network integrity and efficiency.")
                    .font(.body)
                
                Text("Illustrative Example: Interconnecting Networks")
                    .font(.title)
                    .fontWeight(.bold)
                
                Text("Consider a scenario where a gateway facilitates the interconnection of networks with different communication protocols. In such cases, the gateway intelligently translates data between the networks, ensuring seamless communication and preserving the integrity of transmitted information.")
                    .font(.body)
            }
            .padding()
            .frame(width: 400)
            .fontWeight(.semibold)
        }
    }
