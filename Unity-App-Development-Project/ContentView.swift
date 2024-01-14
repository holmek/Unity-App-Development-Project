import SwiftUI

struct ContentView: View {
    @State private var selectedView: String? = "content"
    @State private var columnVisibility = NavigationSplitViewVisibility.all

    var body: some View {
        NavigationView {
            SidebarView(selectedView: $selectedView)
            
            if selectedView == "content" {
                HomeView()
                    .navigationTitle("")
            } else {
                Text("Select an item from the sidebar")
            }
        }
        .navigationSplitViewStyle(.balanced)
        .toolbar {
            ToolbarItem(placement: .navigation) {
                Button(action: toggleSidebar) {
                    Image(systemName: "sidebar.leading")
                }
            }
        }
        .background(Color(hue: 1.0, saturation: 0.0, brightness: 0.075)) // Add this line to set the background color
    }

    private func toggleSidebar() {
        NSApp.keyWindow?.firstResponder?.tryToPerform(#selector(NSSplitViewController.toggleSidebar(_:)), with: nil)
    }
}
