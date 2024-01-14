import SwiftUI

struct NetworkView: View {
    @State private var ipAddress = "Loading..."
    @State private var ipv6Address = "Loading..."
    @State private var macAddress = "Loading..."
    @State private var gatewayAddress = "Loading..."
    @State private var networkName = "Loading..."
    @State private var wifiBand = "Loading..."
    @State private var txRate = "Loading..."
    @State private var subnetMask = "Loading..."
    @State private var wifiAuth = "Loading..."
    @State private var getWiFiCh = "Loading..."
    @State private var getWiFiRS = "Loading..."
    @State private var getIPv4BC = "Loading..."

    @State private var isNetworkNamePopoverPresented = false
    @State private var isMacAddressPopoverPresented = false
    @State private var isGatewayPopoverPresented = false
    @State private var isBroadcastPopoverPresented = false
    @State private var isWifiAuthPopoverPresented = false
    @State private var isSubnetMaskPopoverPresented = false
    @State private var isWifiBandPopoverPresented = false
    @State private var isTxRatePopoverPresented = false
    @State private var isGetWiFiChPopoverPresented = false
    @State private var isGetWiFiRSPopoverPresented = false
    @State private var isGetIPv4BCPopoverPresented = false
    @State private var isIpv6AddressPopoverPresented = false

    var body: some View {
        VStack(alignment: .leading) {
        
            Text("Network Details")
                .font(.largeTitle)
                .fontWeight(.semibold)
            
            Divider()
                .padding(.bottom)
            
            HStack {
                VStack(alignment: .leading) {
                    NetworkInfoRow(title: "SSID", value: networkName)
                        .onTapGesture { isMacAddressPopoverPresented.toggle() }
                        .popover(isPresented: $isMacAddressPopoverPresented) { MacAddressInfoView() }

                    NetworkInfoRow(title: "MAC ADDRESS", value: macAddress)
                        .onTapGesture { isMacAddressPopoverPresented.toggle() }
                        .popover(isPresented: $isMacAddressPopoverPresented) { MacAddressInfoView() }
                }
                
                VStack(alignment: .leading) {
                    NetworkInfoRow(title: "GATEWAY", value: gatewayAddress)
                        .onTapGesture { isGatewayPopoverPresented.toggle() }
                        .popover(isPresented: $isGatewayPopoverPresented) { GatewayInfoView() }

                    NetworkInfoRow(title: "BROADCAST", value: getIPv4BC)
                        .onTapGesture { isBroadcastPopoverPresented.toggle() }
                        .popover(isPresented: $isBroadcastPopoverPresented) { BroadcastInfoView() }
                }

                VStack(alignment: .leading) {
                    NetworkInfoRow(title: "WPA", value: wifiAuth)
                        .onTapGesture { isWifiAuthPopoverPresented.toggle() }
                        .popover(isPresented: $isWifiAuthPopoverPresented) { WifiAuthInfoView() }

                    NetworkInfoRow(title: "SUBNET MASK", value: subnetMask)
                        .onTapGesture { isSubnetMaskPopoverPresented.toggle() }
                        .popover(isPresented: $isSubnetMaskPopoverPresented) { SubnetMaskInfoView() }
                }

                VStack(alignment: .leading) {
                    NetworkInfoRow(title: "BAND", value: wifiBand)
                        .onTapGesture { isWifiBandPopoverPresented.toggle() }
                        .popover(isPresented: $isWifiBandPopoverPresented) { WifiAuthInfoView() }

                    NetworkInfoRow(title: "CHANNEL", value: getWiFiCh)
                        .onTapGesture { isGetWiFiChPopoverPresented.toggle() }
                        .popover(isPresented: $isGetWiFiChPopoverPresented) { WifiAuthInfoView() }
                }

                VStack(alignment: .leading) {
                    NetworkInfoRow(title: "TX MBPS", value: "\(txRate)")
                        .onTapGesture { isTxRatePopoverPresented.toggle() }
                        .popover(isPresented: $isTxRatePopoverPresented) { WifiAuthInfoView() }

                    NetworkInfoRow(title: "SIGNAL STRENGTH", value: getWiFiRS)
                        .onTapGesture { isGetWiFiRSPopoverPresented.toggle() }
                        .popover(isPresented: $isGetWiFiRSPopoverPresented) { WifiAuthInfoView() }
                }

                VStack(alignment: .leading) {
                    NetworkInfoRow(title: "IPV4", value: ipAddress)
                        .onTapGesture { isGetIPv4BCPopoverPresented.toggle() }
                        .popover(isPresented: $isGetIPv4BCPopoverPresented) { WifiAuthInfoView() }

                    NetworkInfoRow(title: "IPV6", value: ipv6Address)
                        .onTapGesture { isIpv6AddressPopoverPresented.toggle() }
                        .popover(isPresented: $isIpv6AddressPopoverPresented) { WifiAuthInfoView() }
                }
            }
            .navigationTitle("Network")
            .onAppear {
                updateInformation()

                Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { _ in
                    updateInformation()
                }
            }
            
            Divider()
                .padding(.vertical)
            
            Text("Discover some extra information by interacting with the different fields on the dashboard")
                .fontWeight(.semibold)
                .font(.caption)
                .foregroundStyle(Color.gray)

            Text("Disclaimer: All data is stored locally, and the developer does not store any information")
                .fontWeight(.semibold)
                .font(.caption)
                .foregroundStyle(Color.gray)
            
            Divider()
                .padding(.vertical)
            
            Text("Developed by Holm Studio")
                .multilineTextAlignment(.leading)
                .font(.caption)
                .fontWeight(.semibold)
            
            Link("holm@holmdev.io", destination: URL(string: "mailto:holm@holmdev.io")!)
                .multilineTextAlignment(.leading)
                .font(.caption)
                .fontWeight(.semibold)
            
        }
        .padding()

    }

    struct NetworkInfoRow: View {
        var title: String
        var value: String

        var body: some View {
            VStack(alignment: .leading) {
                
                Spacer()
                    .padding(.all, 1.0)
                    .frame(width: 1.0, height: 1.0)
                
                Text(title)
                    .fontWeight(.semibold)
                    .font(.headline)
                    .foregroundStyle(Color.gray)
                Text(value)
                    .fontWeight(.semibold)
                    .font(.title2)
            }
            .padding(.trailing)
        }
    }

    private func updateInformation() {
        ipAddress = getIPAddress()
        ipv6Address = getIPv6Address()
        macAddress = getMACAddress()
        subnetMask = getSubnetMask()
        gatewayAddress = getRouterIPAddress()
        networkName = getNetworkName()
        wifiBand = getWiFiBand()
        txRate = getTXRate()
        wifiAuth = getWiFiAuthenticationType()
        getWiFiCh = getWiFiChannel()
        getWiFiRS = getWiFiRSSI()
        getIPv4BC = getIPv4Broadcast()
    }

    func getWiFiRSSI() -> String {
        let command = "/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport -I | awk '/agrCtlRSSI/ {print $2}'"
        return getCommandOutput(command) ?? "Not Found"
    }

    func getWiFiChannel() -> String {
        let command = "/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport -I | awk '/ channel/ {print $2}'"
        return getCommandOutput(command) ?? "Not Found"
    }

    func getWiFiAuthenticationType() -> String {
        let command = "/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport -I | awk '/link auth/ {print $3}'"
        return getCommandOutput(command) ?? "Not Found"
    }

    private func getSubnetMask() -> String {
        let command = "/sbin/ifconfig en0 | awk '/inet / {print $4}'"
        let ipAddressAndSubnet = getCommandOutput(command) ?? "Not Found"
        let components = ipAddressAndSubnet.components(separatedBy: ".")
        
        _ = components.prefix(3).joined(separator: ".")
        let subnetMask = components.last ?? "Not Found"
        
        return subnetMask
    }

    private func getIPAddress() -> String {
        return getCommandOutput("/sbin/ifconfig en0 | grep inet | awk '$1 == \"inet\" {print $2}'") ?? "Not Found"
    }

    private func getIPv6Address() -> String {
        return getCommandOutput("/sbin/ifconfig en0 | awk '/inet6/ && $2 !~ /^fe80:/ {print $2}'") ?? "Not Found"
    }

    private func getIPv4Broadcast() -> String {
        return getCommandOutput("/sbin/ifconfig en0 | awk '/broadcast/ {print $6}'") ?? "Not Found"
    }

    private func getMACAddress() -> String {
        return getCommandOutput("/sbin/ifconfig en0 | grep ether | awk '{print $2}'") ?? "Not Found"
    }

    private func getRouterIPAddress() -> String {
        let command = "/usr/sbin/netstat -rn | awk '$1 == \"default\" {print $2; exit}'"
        return getCommandOutput(command) ?? "Not Found"
    }

    private func getNetworkName() -> String {
        let command = "/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport -I | awk '/ SSID/ {print $2}'"
        return getCommandOutput(command) ?? "Not Found"
    }

    private func getWiFiBand() -> String {
        let command = "/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport -I | awk '/ channel/ {if ($2 <= 14) print \"2.4 GHz\"; else print \"5 GHz\"}'"
        return getCommandOutput(command) ?? "Not Found"
    }

    private func getTXRate() -> String {
        let command = "/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport -I | awk '/ lastTxRate/ {print $2}'"
        return getCommandOutput(command) ?? "Not Found"
    }

    private func getCommandOutput(_ command: String) -> String? {
        let task = Process()
        let pipe = Pipe()
        
        task.standardOutput = pipe
        task.arguments = ["-c", command]
        task.launchPath = "/bin/zsh"
        
        task.launch()
        
        let data = pipe.fileHandleForReading.readDataToEndOfFile()
        guard let output = String(data: data, encoding: .utf8)?.trimmingCharacters(in: .newlines), !output.isEmpty else {
            return nil
        }
        
        return output
    }

    }
