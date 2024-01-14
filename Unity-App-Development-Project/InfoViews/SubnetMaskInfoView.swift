//
//  BroadcastInfoView.swift
//  BITIFY
//
//  Created by Holm on 16/11/2023.
//

import Foundation
import SwiftUI

struct SubnetMaskInfoView: View {
    var body: some View {
          VStack(alignment: .leading, spacing: 16) {
              Text("SUBNET MASK")
                  .font(.largeTitle)
                  .fontWeight(.bold)
              
              Text("A subnet mask is a fundamental component in networking that serves to segment and organize IP addresses into distinct subnetworks. It plays a pivotal role in defining the boundaries of these subnetworks and facilitating efficient data routing.")
                  .font(.body)
              
              Text("Purpose in Network Segmentation")
                  .font(.title)
                  .fontWeight(.bold)
              
              Text("The primary purpose of a subnet mask is to partition an IP address into network and host portions. By doing so, it enables the creation of smaller, manageable subnetworks within a larger network. This segmentation enhances network performance, security, and management.")
                  .font(.body)
              
              Text("Subnetting Strategies and Benefits")
                  .font(.title)
                  .fontWeight(.bold)
              
              Text("Network administrators employ various subnetting strategies based on organizational requirements. Subnet masks provide flexibility in designing networks, allowing for efficient utilization of IP addresses and improved control over traffic flow. Additionally, subnetting enhances security by isolating segments of the network.")
                  .font(.body)
              
              Text("Implementation Example: Address Allocation")
                  .font(.title)
                  .fontWeight(.bold)
              
              Text("Consider the implementation of subnet masks in address allocation. By applying subnetting, an organization can allocate IP addresses more judiciously, streamline network management, and enhance overall network performance.")
                  .font(.body)
          }
          .padding()
          .frame(width: 400)
          .fontWeight(.semibold)
      }
  }
