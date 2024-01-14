// WifiAuthInfoView.swift
// BITIFY
// Created by Holm on 16/11/2023.

import SwiftUI

struct WifiAuthInfoView: View {
    var body: some View {
         VStack(alignment: .leading, spacing: 16) {
             Text("WI-FI PROTECTED ACCESS (WPA)")
                 .font(.largeTitle)
                 .fontWeight(.bold)
             
             Text("Wi-Fi Protected Access (WPA) is a security protocol designed to enhance the privacy and integrity of wireless networks. It addresses vulnerabilities present in earlier security standards, providing robust encryption and authentication mechanisms.")
                 .font(.body)
             
             Text("Enhancements Over WEP")
                 .font(.title)
                 .fontWeight(.bold)
             
             Text("WPA addresses the shortcomings of Wired Equivalent Privacy (WEP), a previous wireless security protocol. It introduces stronger encryption algorithms, such as TKIP (Temporal Key Integrity Protocol) and later versions utilize AES (Advanced Encryption Standard), significantly improving data protection.")
                 .font(.body)
             
             Text("Authentication and Key Management")
                 .font(.title)
                 .fontWeight(.bold)
             
             Text("WPA employs more secure methods for user authentication, such as 802.1X and pre-shared keys (PSK). Additionally, it features robust key management mechanisms to dynamically generate and refresh encryption keys, enhancing overall network security.")
                 .font(.body)
             
             Text("WPA2 and WPA3")
                 .font(.title)
                 .fontWeight(.bold)
             
             Text("Successive iterations, namely WPA2 and WPA3, further enhance wireless security. WPA2 employs the CCMP (Counter Cipher Mode with Block Chaining Message Authentication Code Protocol) for data encryption, while WPA3 introduces additional features, including improved cryptographic algorithms and protection against brute-force attacks.")
                 .font(.body)
         }
         .padding()
         .frame(width: 400)
         .fontWeight(.semibold)
     }
 }
