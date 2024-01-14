import SwiftUI

struct SettingsView: View {
    
    func getSystemFirmwareVersion() -> String {
        let process = Process()
        process.launchPath = "/usr/sbin/system_profiler"
        process.arguments = ["SPHardwareDataType"]

        let pipe = Pipe()
        process.standardOutput = pipe
        process.launch()
        
        let data = pipe.fileHandleForReading.readDataToEndOfFile()
        let outputString = String(data: data, encoding: .utf8) ?? ""
        
        if let firmwareVersionRange = outputString.range(of: "System Firmware Version:") {
            let firmwareVersion = outputString[firmwareVersionRange.upperBound...]
                .components(separatedBy: "\n")[0] // Extract the first line
                .trimmingCharacters(in: .whitespacesAndNewlines)
            return firmwareVersion
        } else {
            return "N/A"
        }
    }

    func getOSLoaderVersion() -> String {
        let process = Process()
        process.launchPath = "/usr/sbin/system_profiler"
        process.arguments = ["SPHardwareDataType"]

        let pipe = Pipe()
        process.standardOutput = pipe
        process.launch()
        
        let data = pipe.fileHandleForReading.readDataToEndOfFile()
        let outputString = String(data: data, encoding: .utf8) ?? ""
        
        if let loaderVersionRange = outputString.range(of: "OS Loader Version:") {
            let loaderVersion = outputString[loaderVersionRange.upperBound...]
                .components(separatedBy: "\n")[0] // Extract the first line
                .trimmingCharacters(in: .whitespacesAndNewlines)
            return loaderVersion
        } else {
            return "N/A"
        }
    }

    func getSerialNumberSystem() -> String {
        let process = Process()
        process.launchPath = "/usr/sbin/system_profiler"
        process.arguments = ["SPHardwareDataType"]

        let pipe = Pipe()
        process.standardOutput = pipe
        process.launch()
        
        let data = pipe.fileHandleForReading.readDataToEndOfFile()
        let outputString = String(data: data, encoding: .utf8) ?? ""
        
        if let serialNumberRange = outputString.range(of: "Serial Number (system):") {
            let serialNumber = outputString[serialNumberRange.upperBound...]
                .components(separatedBy: "\n")[0] // Extract the first line
                .trimmingCharacters(in: .whitespacesAndNewlines)
            return serialNumber
        } else {
            return "N/A"
        }
    }
    
    func getHardwareUUID() -> String {
        let process = Process()
        process.launchPath = "/usr/sbin/system_profiler"
        process.arguments = ["SPHardwareDataType"]

        let pipe = Pipe()
        process.standardOutput = pipe
        process.launch()
        
        let data = pipe.fileHandleForReading.readDataToEndOfFile()
        let outputString = String(data: data, encoding: .utf8) ?? ""
        
        if let hardwareUUIDRange = outputString.range(of: "Hardware UUID:") {
            let hardwareUUID = outputString[hardwareUUIDRange.upperBound...]
                .components(separatedBy: "\n")[0] // Extract the first line
                .trimmingCharacters(in: .whitespacesAndNewlines)
            return hardwareUUID
        } else {
            return "N/A"
        }
    }

    func getProvisioningUDID() -> String {
        let process = Process()
        process.launchPath = "/usr/sbin/system_profiler"
        process.arguments = ["SPHardwareDataType"]

        let pipe = Pipe()
        process.standardOutput = pipe
        process.launch()
        
        let data = pipe.fileHandleForReading.readDataToEndOfFile()
        let outputString = String(data: data, encoding: .utf8) ?? ""
        
        if let provisioningUDIDRange = outputString.range(of: "Provisioning UDID:") {
            let provisioningUDID = outputString[provisioningUDIDRange.upperBound...]
                .components(separatedBy: "\n")[0] // Extract the first line
                .trimmingCharacters(in: .whitespacesAndNewlines)
            return provisioningUDID
        } else {
            return "N/A"
        }
    }

    func getActivationLockStatus() -> String {
        let process = Process()
        process.launchPath = "/usr/sbin/system_profiler"
        process.arguments = ["SPHardwareDataType"]

        let pipe = Pipe()
        process.standardOutput = pipe
        process.launch()
        
        let data = pipe.fileHandleForReading.readDataToEndOfFile()
        let outputString = String(data: data, encoding: .utf8) ?? ""
        
        if let activationLockStatusRange = outputString.range(of: "Activation Lock Status:") {
            let activationLockStatus = outputString[activationLockStatusRange.upperBound...]
                .components(separatedBy: "\n")[0] // Extract the first line
                .trimmingCharacters(in: .whitespacesAndNewlines)
            return activationLockStatus
        } else {
            return "N/A"
        }
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Settings")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(Color.gray)
            
            Spacer()
                .padding(.all, 1.0)
                .frame(width: 1.0, height: 1.0)
            
            HStack{
                VStack(alignment: .leading, spacing: 5) {
                    Text("WELCOME TO BITIFY")
                        .font(.headline)
                        .fontWeight(.semibold)
                        .multilineTextAlignment(.leading)
                    
                    Text("WELCOME TO BITIFY")
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                        .multilineTextAlignment(.leading)
                    
                    Text("DEVELOPED BY EMIL HOLMGAARD")
                        .multilineTextAlignment(.leading)
                        .textCase(.uppercase)
                        .font(.headline)
                        .fontWeight(.semibold)
                    
                    Text("HERE ARE SOME INFORMATION ABOUT YOUR SYSTEM")
                        .multilineTextAlignment(.leading)
                        .textCase(.uppercase)
                        .font(.caption)
                        .fontWeight(.semibold)
                    
                    Link("holm@holmdev.io", destination: URL(string: "mailto:holm@holmdev.io")!)
                        .foregroundColor(Color(hue: 0.655, saturation: 1.0, brightness: 1.0))
                        .fontWeight(.semibold)
                }
                .frame(width: 290.0)
                
                Divider()
                    .frame(height: 200.0)
                
                VStack(alignment: .leading, spacing: 20) {
                    Text("INFORMATION").font(.headline)
                    DeveloperInfoRow(title: "System Firmware Version", value: getSystemFirmwareVersion())
                    
                    DeveloperInfoRow(title: "OS Loader Version", value: getOSLoaderVersion())

                    
                }
                .frame(width: 140.0)
                
                Spacer().padding(.all, 1.0).frame(width: 1.0, height: 1.0)
                
                VStack(alignment: .leading, spacing: 20) {
                    Text("").font(.headline)
                    DeveloperInfoRow(title: "Provisioning UDID", value: getProvisioningUDID())

                    DeveloperInfoRow(title: "Hardware UUID", value: getHardwareUUID())
                }
                .frame(width: 400.0)
                
                Spacer().padding(.all, 1.0).frame(width: 1.0, height: 1.0)
                
                VStack(alignment: .leading, spacing: 20) {
                    Text("").font(.headline)
                    
                    DeveloperInfoRow(title: "Provisioning UDID", value: getProvisioningUDID())
                    
                    DeveloperInfoRow(title: "Activation Lock Status", value: getActivationLockStatus())
                
                }
                .frame(width: 140.0)
                

            }
            Text("Discover some extra information by interacting with the different fields on the dashboard")
                .font(.headline).fontWeight(.semibold).padding(.horizontal).multilineTextAlignment(.center)
            
            Text("Disclaimer: All data is stored locally, and the developer does not store any information")
                .font(.caption).fontWeight(.semibold).padding(.horizontal).multilineTextAlignment(.center)
        }
    }
}

struct DeveloperInfoRow: View {
    let title: String
    let value: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(title)
                .fontWeight(.semibold)
            
            Text(value)
                .fontWeight(.semibold)
        }
        .navigationTitle("Home")
    }
}



