import SwiftUI

struct PopoverView: View {
    var body: some View {
        VStack(spacing: 10) {
            Text("GitHub Commit Activity")
                .font(.headline)
                .padding()

            Text("30-day commit summary will be here")
                .font(.subheadline)
                .foregroundColor(.gray)

            Divider()

            Button("Open GitHub") {
                if let url = URL(string: "https://github.com") {
                    NSWorkspace.shared.open(url)
                }
            }
            .buttonStyle(LinkButtonStyle())

            Button("Settings") {
                print("Settings will be implemented")
            }
            .padding(.bottom, 10)
        }
        .frame(width: 250)
        .padding()
    }
}
