import SwiftUI

struct BroadcastInfoView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("BROADCAST")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            Text("Network broadcasting is a communication paradigm that involves the dissemination of data to all devices within a specified network segment. This method ensures widespread information distribution and plays a pivotal role in various networking protocols.")
                .font(.body)
            
            Text("Usage in Advanced Networking")
                .font(.title)
                .fontWeight(.bold)
            
            Text("In advanced networking environments, broadcasting is extensively utilized for the implementation of critical protocols. Notably, protocols like ARP (Address Resolution Protocol) leverage broadcasting to resolve network layer addresses to corresponding link layer addresses.")
                .font(.body)
            
            Text("Diverse Methods of Broadcasting")
                .font(.title)
                .fontWeight(.bold)
            
            Text("The methodologies employed in network broadcasting are diverse and sophisticated. Within this context, the utilization of Media Access Control (MAC) addresses as a broadcasting mechanism is of particular interest. MAC addresses are strategically employed in scenarios where reaching all devices in a local network segment is imperative.")
                .font(.body)
            
            Text("Illustrative Example: ARP Broadcasting")
                .font(.title)
                .fontWeight(.bold)
            
            Text("For instance, the Address Resolution Protocol (ARP) exemplifies the use of MAC addresses for broadcasting. ARP broadcasts messages within a local network to map an Internet Protocol (IP) address, a logical address, to the corresponding MAC address, a physical address.")
                .font(.body)
        }
        .padding()
        .frame(width: 400)
        .fontWeight(.semibold)
    }
}
