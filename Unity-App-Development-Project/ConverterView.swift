import SwiftUI

enum InputType: String, CaseIterable {
    case decimal = "Decimal"
    case binary = "Binary"
    case hex = "Hex"
}

struct ConverterView: View {
    @State private var inputText = ""
    @State private var selectedInputType = InputType.decimal

    var body: some View {
        HStack(spacing: 20) {
            Text("Network")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(Color.gray)
            Spacer()
                .padding(.all, 1.0)
                .frame(width: 1.0, height: 1.0)
            VStack(alignment: .leading, spacing: 5) {
                Text("HEX / BINARY / DECIMAL")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.leading)
                Text("CONVERTER")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.leading)
                Text("HERE YOU HAVE THE OPPURTINY TO CONVERT YOU VALUES")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.leading)
                Picker("TYPES", selection: $selectedInputType) {
                    ForEach(InputType.allCases, id: \.self) { type in
                        Text(type.rawValue).tag(type)
                    }
                }
                .labelsHidden()
                .pickerStyle(SegmentedPickerStyle())
                .padding(.top)

                TextField("input", text: $inputText)
                    .textFieldStyle(RoundedBorderTextFieldStyle()) // Use standard rounded style

            }
            .frame(width: 200)

            Divider()
                .frame(height: 200.0)
            
            VStack(alignment: .leading, spacing: 5) {
                Text("RESULTS")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.leading)
            }
            .frame(width: 100)
            
            Group {
                HStack(alignment: .top) {
                    VStack(alignment: .leading, spacing: 10) {
                        switch selectedInputType {
                        case .decimal:
                            if let intValue = extractValidInt(from: inputText) {
                                Text("HEX")
                                    .font(.subheadline)
                                    .fontWeight(.semibold)
                                Text(String(intValue, radix: 16))
                                    .font(.subheadline)
                                    .fontWeight(.semibold)
                                Text("BINARY")
                                    .font(.subheadline)
                                    .fontWeight(.semibold)
                                Text(String(intValue, radix: 2))
                                    .font(.subheadline)
                                    .fontWeight(.semibold)
                            } else {
                                Text("HEX")
                                    .font(.subheadline)
                                    .fontWeight(.semibold)
                                Text("00F1")
                                    .font(.subheadline)
                                    .fontWeight(.semibold)
                                    .foregroundStyle(Color.gray)
                                Text("BINARY")
                                    .font(.subheadline)
                                    .fontWeight(.semibold)
                                Text("101010")
                                    .font(.subheadline)
                                    .fontWeight(.semibold)
                                    .foregroundStyle(Color.gray)

                            }
                        case .binary:
                            if let binaryValue = extractValidInt(from: inputText, radix: 2) {
                                Text("HEX")
                                    .font(.subheadline)
                                    .fontWeight(.semibold)
                                Text(String(binaryValue, radix: 16))
                                    .font(.subheadline)
                                    .fontWeight(.semibold)
                                Text("DECIMAL")
                                    .font(.subheadline)
                                    .fontWeight(.semibold)
                                Text("Decimal: \(binaryValue)")
                                    .font(.subheadline)
                                    .fontWeight(.semibold)
                            } else {
                                Text("HEX")
                                    .font(.subheadline)
                                    .fontWeight(.semibold)
                                Text("00F1")
                                    .font(.subheadline)
                                    .fontWeight(.semibold)
                                    .foregroundStyle(Color.gray)
                                Text("DECIMAL")
                                    .font(.subheadline)
                                    .fontWeight(.semibold)
                                Text("314")
                                    .font(.subheadline)
                                    .fontWeight(.semibold)
                                    .foregroundStyle(Color.gray)
                            }
                        case .hex:
                            if let hexValue = extractValidInt(from: inputText, radix: 16) {
                                Text("BINARY")
                                    .font(.subheadline)
                                    .fontWeight(.semibold)
                                Text(String(hexValue, radix: 2))
                                    .font(.subheadline)
                                    .fontWeight(.semibold)
                                Text("DECIMAL")
                                    .font(.subheadline)
                                    .fontWeight(.semibold)
                                Text("Decimal: \(hexValue)")
                                    .font(.subheadline)
                                    .fontWeight(.semibold)
                            } else {
                                Text("BINARY")
                                    .font(.subheadline)
                                    .fontWeight(.semibold)
                                Text("101010")
                                    .font(.subheadline)
                                    .fontWeight(.semibold)
                                    .foregroundStyle(Color.gray)
                                Text("DECIMAL")
                                    .font(.subheadline)
                                    .fontWeight(.semibold)
                                Text("314")
                                    .font(.subheadline)
                                    .fontWeight(.semibold)
                                    .foregroundStyle(Color.gray)
                            }
                        }
                    }
                    Spacer()
                }
                .frame(width: 400)
            }


        }
        .padding()
        .navigationTitle("Converter")
    }

    private func extractValidInt(from input: String, radix: Int = 10) -> Int? {
        // Remove non-numeric characters (except '-' for negative numbers)
        let cleanedInput = input.replacingOccurrences(of: "[^0-9-]", with: "", options: .regularExpression)

        return Int(cleanedInput, radix: radix)
    }
}

struct ConverterView_Previews: PreviewProvider {
    static var previews: some View {
        ConverterView()
    }
}
