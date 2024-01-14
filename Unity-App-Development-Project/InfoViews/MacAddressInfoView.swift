import SwiftUI

struct MacAddressInfoView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("MAC ADDRESS")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            Text("A MAC address, or Media Access Control address, is a unique identifier assigned to network interfaces for communications at the data link layer of a network segment.")
                .font(.body)
            
            Text("Usage in Networks")
                .font(.title)
                .fontWeight(.bold)
            
            Text("In networking, MAC addresses play a crucial role in uniquely identifying devices on a network. Each network interface card (NIC) or network adapter is assigned a unique MAC address during manufacturing.")
                .font(.body)
            
            Text("Format of a MAC Address")
                .font(.title)
                .fontWeight(.bold)
            
            Text("A MAC address is usually represented as six groups of two hexadecimal digits, separated by colons or dashes. For example, 00:1A:2B:3C:4D:5E.")
                .font(.body)
            
            Text("Broadcasting with MAC Addresses")
                .font(.title)
                .fontWeight(.bold)
            
            Text("In certain network scenarios, MAC addresses can be used for broadcasting messages within a local network segment.")
                .font(.body)
            
            Text("For instance, ARP (Address Resolution Protocol) is a protocol that uses MAC addresses for broadcasting to map an IP address (logical address) to a MAC address (physical address) on a local network.")
                .font(.body)
        }
        .padding()
        .frame(width: 400)
        .fontWeight(.semibold)
    }
}

struct MacAddressInfoView_Previews: PreviewProvider {
    static var previews: some View {
        MacAddressInfoView()
    }
}
