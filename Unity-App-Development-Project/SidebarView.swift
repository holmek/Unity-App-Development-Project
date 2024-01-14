import SwiftUI

struct SidebarView: View {
    @Binding var selectedView: String?

    var body: some View {
        List(selection: $selectedView) {
            Section(header: Text("My App")) {
                NavigationLink(destination: HomeView(), tag: "content", selection: $selectedView) {
                    Label("Home", systemImage: "house")
                }
                NavigationLink(destination: ConverterView(), tag: "converter", selection: $selectedView) {
                    Label("Converter", systemImage: "circle")
                }
                NavigationLink(destination: SettingsView(), tag: "settings", selection: $selectedView) {
                    Label("Settings", systemImage: "gearshape")
                }
            }
        }
        .frame(width: 240)
        .listStyle(SidebarListStyle())
        .background(Color(hue: 1.0, saturation: 0.0, brightness: 0.075)) // Add this line to set the background color

    }
}
