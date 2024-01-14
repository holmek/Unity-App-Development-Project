import SwiftUI

struct SystemView: View {
    let osVersion = ProcessInfo.processInfo.operatingSystemVersion
    let hostName = Host.current().localizedName ?? "Ukendt"
    let memorySize = ByteCountFormatter.string(fromByteCount: Int64(ProcessInfo.processInfo.physicalMemory), countStyle: .memory)
    
    func getTotalNumberOfCores() -> String {
        if let count = ProcessInfo.processInfo.processorCount as Int? {
            return "\(count)"
        } else {
            return "N/A"
        }
    }
    
    func getModelName() -> String {
        let process = Process()
        process.launchPath = "/usr/sbin/system_profiler"
        process.arguments = ["SPHardwareDataType"]

        let pipe = Pipe()
        process.standardOutput = pipe
        process.launch()
        
        let data = pipe.fileHandleForReading.readDataToEndOfFile()
        let outputString = String(data: data, encoding: .utf8) ?? ""
        
        if let modelNameRange = outputString.range(of: "Model Name:") {
            let modelName = outputString[modelNameRange.upperBound...]
                .components(separatedBy: "\n")[0]
                .trimmingCharacters(in: .whitespacesAndNewlines)
            return modelName
        } else {
            return "N/A"
        }
    }

    func getModelIdentifier() -> String {
        var size: size_t = 0
        sysctlbyname("hw.model", nil, &size, nil, 0)

        var model = [CChar](repeating: 0, count: Int(size))
        sysctlbyname("hw.model", &model, &size, nil, 0)

        let modelIdentifier = String(cString: model)
        return modelIdentifier.trimmingCharacters(in: .whitespacesAndNewlines)
    }

    func getModelNumber() -> String {
        let process = Process()
        process.launchPath = "/usr/sbin/system_profiler"
        process.arguments = ["SPHardwareDataType"]

        let pipe = Pipe()
        process.standardOutput = pipe
        process.launch()
        
        let data = pipe.fileHandleForReading.readDataToEndOfFile()
        let outputString = String(data: data, encoding: .utf8) ?? ""
        
        if let modelNumberRange = outputString.range(of: "Model Number:") {
            let modelNumber = outputString[modelNumberRange.upperBound...]
                .components(separatedBy: "\n")[0] // Extract the first line
                .trimmingCharacters(in: .whitespacesAndNewlines)
            return modelNumber
        } else {
            return "N/A"
        }
    }

    func getBuildVersion() -> String {
        var size: size_t = 0
        sysctlbyname("kern.osversion", nil, &size, nil, 0)

        var buildVersion = [CChar](repeating: 0, count: Int(size))
        sysctlbyname("kern.osversion", &buildVersion, &size, nil, 0)

        let versionString = String(cString: buildVersion)
        return versionString.trimmingCharacters(in: .whitespacesAndNewlines)
    }

    func getSerialNumber() -> String {
        let process = Process()
        process.launchPath = "/usr/sbin/system_profiler"
        process.arguments = ["SPHardwareDataType"]
        
        let pipe = Pipe()
        process.standardOutput = pipe
        process.launch()
        
        let data = pipe.fileHandleForReading.readDataToEndOfFile()
        
        if let outputString = String(data: data, encoding: .utf8) {
            if let serialNumberRange = outputString.range(of: "Serial Number (system):") {
                return outputString[serialNumberRange.upperBound...]
                    .prefix(while: { !$0.isNewline })
                    .trimmingCharacters(in: .whitespacesAndNewlines)
            }
        }
        return "N/A"
    }
    
    func getCPUInfo() -> String {
        var size = 0
        sysctlbyname("machdep.cpu.brand_string", nil, &size, nil, 0)
        var cpuInfo = [CChar](repeating: 0, count: size)
        sysctlbyname("machdep.cpu.brand_string", &cpuInfo, &size, nil, 0)
        return String(cString: cpuInfo)
    }
    
    var body: some View {
        VStack(alignment: .leading) {

            Text("System details")
                .font(.largeTitle)
                .fontWeight(.semibold)
            
            Divider()
                .padding(.bottom)
            
            HStack{                
                VStack(alignment: .leading) {
                    SystemInfoRow(title: "Host Name", value: hostName)
                    SystemInfoRow(title: "Model Name", value: getModelName())
                }
                
                VStack(alignment: .leading) {
                    SystemInfoRow(title: "CPU", value: getCPUInfo())
                    SystemInfoRow(title: "RAM", value: memorySize)
                }
                
                VStack(alignment: .leading) {
                    SystemInfoRow(title: "Number of Cores", value: getTotalNumberOfCores())
                    SystemInfoRow(title: "Model Identifier", value: getModelIdentifier())
                }
                
                VStack(alignment: .leading) {
                    SystemInfoRow(title: "Serial Number", value: getSerialNumber())
                    SystemInfoRow(title: "Model Number", value: getModelNumber())
                }

                VStack(alignment: .leading) {
                    SystemInfoRow(title: "macOS Version", value: "\(osVersion.majorVersion).\(osVersion.minorVersion).\(osVersion.patchVersion)")
                    SystemInfoRow(title: "Build Version", value: getBuildVersion())
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
}

struct SystemInfoRow: View {
    let title: String
    let value: String
    
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
        .navigationTitle("Home")
    }
}

struct SystemView_Previews: PreviewProvider {
    static var previews: some View {
        SystemView()
    }
}

