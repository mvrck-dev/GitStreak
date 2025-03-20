import SwiftUI

struct PopoverView: View {
    var body: some View {
<<<<<<< HEAD
        VStack(spacing: 10) {
            Text("GitHub Commit Activity")
                .font(.headline)
                .padding()

=======
        VStack {
            Text("GitHub Commit Activity")
                .font(.headline)
            
>>>>>>> 9fea78c (still shit - nothing works)
            Text("30-day commit summary will be here")
                .font(.subheadline)
                .foregroundColor(.gray)

            Divider()
<<<<<<< HEAD

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
=======
            
            Button("Open GitHub") {
                NSWorkspace.shared.open(URL(string: "https://github.com")!)
            }
            .padding(.top, 5)

            Button("Settings") {
                openSettingsWindow()
            }
            .padding(.top, 5)
        }
        .padding()
    }

    func openSettingsWindow() {
        let window = NSWindow(
            contentRect: NSRect(x: 0, y: 0, width: 300, height: 200),
            styleMask: [.titled, .closable, .resizable],
            backing: .buffered,
            defer: false
        )
        window.contentView = NSHostingView(rootView: GitStreakSettingsView())
        window.makeKeyAndOrderFront(nil)
    }
}

>>>>>>> 9fea78c (still shit - nothing works)
