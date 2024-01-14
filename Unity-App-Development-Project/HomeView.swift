import SwiftUI

struct HomeView: View {
    @State private var isNetworkViewPresented = false
    @State private var isSecondBoxPresented = false
    @State private var isThirdBoxPresented = false
    @State private var isFourthBoxPresented = false

    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                VStack(alignment: .leading) {
                    Text("Bitify")
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                        .multilineTextAlignment(.leading)

                    Text("Privacy-Centric App")
                        .multilineTextAlignment(.leading)
                        .font(.title)
                        .fontWeight(.semibold)
                    Divider()
                }
            }

            HStack {
                // First Box
                RoundedRectangle(cornerRadius: 10)
                    .overlay(
                        Image("SystemView") // Antager, at dit billede hedder "SystemView"
                            .resizable()
                            .scaledToFill()
                            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                            .clipShape(RoundedRectangle(cornerRadius: 10)) // Klip billedet med samme afrundingsradius som RoundedRectangle
                    )
                    .shadow(radius: 10, x: 5, y: 5) // Skygge
                    .overlay(
                        VStack {
                            Text("Discover your")
                                .font(.headline)
                                .frame(maxWidth: .infinity, alignment: .leading)

                            Text("System")
                                .font(.title)
                                .fontWeight(.semibold)
                                .frame(maxWidth: .infinity, alignment: .leading)
                        }
                        .padding()
                    )
                    .padding()
                    .onTapGesture {
                        self.isNetworkViewPresented.toggle()
                    }
                    .sheet(isPresented: $isNetworkViewPresented) {
                        SystemView()
                    }
                    .frame(minWidth: 200, minHeight: 150, maxHeight: 200)


                // Second Box (Apply the same neumorphic style)
                RoundedRectangle(cornerRadius: 10)
                    .overlay(
                        Image("NetworkView") // Antager, at dit billede hedder "SystemView"
                            .resizable()
                            .scaledToFill()
                            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                            .clipShape(RoundedRectangle(cornerRadius: 10)) // Klip billedet med samme afrundingsradius som RoundedRectangle
                    )
                    .shadow(radius: 10, x: 5, y: 5) // Shadow
                    .overlay(
                        VStack {
                            Text("Discover your")
                                .font(.headline)
                                .frame(maxWidth: .infinity, alignment: .leading)

                            Text("Network")
                                .font(.title)
                                .fontWeight(.semibold)
                                .frame(maxWidth: .infinity, alignment: .leading)
                        }
                        .padding()
                    )
                    .padding()
                    .onTapGesture {
                        self.isSecondBoxPresented.toggle()
                    }
                    .sheet(isPresented: $isSecondBoxPresented) {
                        NetworkView()
                    }
                    .frame(minWidth: 200, minHeight: 150, maxHeight: 200)

                // Third Box (Apply the same neumorphic style)
                RoundedRectangle(cornerRadius: 10)
                    .overlay(
                        Image("ConverterView") // Antager, at dit billede hedder "SystemView"
                            .resizable()
                            .scaledToFill()
                            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                            .clipShape(RoundedRectangle(cornerRadius: 10)) // Klip billedet med samme afrundingsradius som RoundedRectangle
                    )
                    .shadow(radius: 10, x: 5, y: 5) // Shadow
                    .overlay(
                        VStack {
                            Text("Discover your")
                                .font(.headline)
                                .frame(maxWidth: .infinity, alignment: .leading)

                            Text("Converter")
                                .font(.title)
                                .fontWeight(.semibold)
                                .frame(maxWidth: .infinity, alignment: .leading)
                        }
                        .padding()
                    )
                    .padding()
                    .onTapGesture {
                        self.isThirdBoxPresented.toggle()
                    }
                    .sheet(isPresented: $isThirdBoxPresented) {
                        ConverterView()
                    }
                    .frame(minWidth: 200, minHeight: 150, maxHeight: 200)

                // Fourth Box (Apply the same neumorphic style)
                RoundedRectangle(cornerRadius: 10)
                    .shadow(radius: 10, x: 5, y: 5) // Shadow
                    .overlay(
                        VStack {
                            Text("Discover your")
                                .font(.headline)
                                .frame(maxWidth: .infinity, alignment: .leading)

                            Text("Settings")
                                .font(.title)
                                .fontWeight(.semibold)
                                .frame(maxWidth: .infinity, alignment: .leading)
                        }
                        .padding()
                    )
                    .padding()
                    .onTapGesture {
                        self.isFourthBoxPresented.toggle()
                    }
                    .sheet(isPresented: $isFourthBoxPresented) {
                        // Replace with the view you want to present for the fourth box
                        // Example: FourthBoxView()
                    }
                    .frame(minWidth: 200, minHeight: 150, maxHeight: 200)
            }

            Spacer().padding(.all, 1.0).frame(width: 1.0, height: 1.0)

            Divider()

            Spacer().padding(.all, 1.0).frame(width: 1.0, height: 1.0)

            VStack(alignment: .leading) {
                Text("Developed by Holm Studio")
                    .multilineTextAlignment(.leading)
                    .font(.caption)
                    .fontWeight(.semibold)

                Link("holm@holmdev.io", destination: URL(string: "mailto:holm@holmdev.io")!)
                    .multilineTextAlignment(.leading)
                    .font(.caption)
                    .fontWeight(.semibold)
            }
        }
        .padding()
        .background(Color(hue: 1.0, saturation: 0.0, brightness: 0.075)) // Add this line to set the background color
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
