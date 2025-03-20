import SwiftUI

struct GitStreakSettingsView: View {
    var body: some View {
        ZStack {
            // Translucent effect
            VisualEffectView(material: .hudWindow, blendingMode: .behindWindow)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Spacer()
                
                // GitHub Sign-In Button
                Button(action: {
                    signInWithGitHub()
                }) {
                    HStack {
                        Image(systemName: "globe") // Replace with GitHub logo asset
                            .resizable()
                            .frame(width: 24, height: 24)
                        Text("Sign In with GitHub")
                            .font(.title2)
                            .bold()
                    }
                    .padding()
                    .background(Color.black.opacity(0.8))
                    .foregroundColor(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                }
                
                Spacer()
            }
            .frame(width: 400, height: 300)
        }
    }
    
    func signInWithGitHub() {
        // Implement OAuth authentication here
        if let url = URL(string: "https://github.com/login/oauth/authorize?client_id=YOUR_CLIENT_ID") {
            NSWorkspace.shared.open(url)
        }
    }
}

// Helper for macOS translucent background
struct VisualEffectView: NSViewRepresentable {
    var material: NSVisualEffectView.Material
    var blendingMode: NSVisualEffectView.BlendingMode

    func makeNSView(context: Context) -> NSVisualEffectView {
        let view = NSVisualEffectView()
        view.material = material
        view.blendingMode = blendingMode
        view.state = .active
        return view
    }

    func updateNSView(_ nsView: NSVisualEffectView, context: Context) {}
}
