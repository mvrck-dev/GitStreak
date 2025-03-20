//
//  AppDelegate.swift
//  GitStreak
//
//  Created by Rupankar on 21/03/25.
//


import SwiftUI
import AppKit

class AppDelegate: NSObject, NSApplicationDelegate {
    var statusItem: NSStatusItem?
    var popover = NSPopover()

    func applicationDidFinishLaunching(_ notification: Notification) {
        NSApp.setActivationPolicy(.accessory) // Hides from Dock & Cmd+Tab
        setupMenuBar()
    }

    private func setupMenuBar() {
        // Create a menu bar item with a fixed width
        statusItem = NSStatusBar.system.statusItem(withLength: 80)

        if let button = statusItem?.button {
            button.image = createCommitChartImage()
            button.action = #selector(togglePopover(_:))
            button.target = self
        }

        // Set up popover view
        popover.contentViewController = NSHostingController(rootView: PopoverView())
        popover.behavior = .transient // Auto-dismiss when clicking outside
    }

    @objc private func togglePopover(_ sender: AnyObject?) {
        if let button = statusItem?.button {
            if popover.isShown {
                popover.performClose(sender)
            } else {
                popover.show(relativeTo: button.bounds, of: button, preferredEdge: .minY)
            }
        }
    }

    private func createCommitChartImage() -> NSImage {
        let totalBlocks = 5
        let blockSize = NSSize(width: 14, height: 14)
        let spacing: CGFloat = 2.5
        let leftPadding: CGFloat = 4.0
        let rightPadding: CGFloat = 4.0
        let totalWidth = (CGFloat(totalBlocks) * blockSize.width) + (CGFloat(totalBlocks - 1) * spacing) + leftPadding + rightPadding

        let size = NSSize(width: totalWidth, height: 20)
        let image = NSImage(size: size)

        image.lockFocus()

        let colors: [NSColor] = [
                NSColor(hex: "#161b22") ?? .black, // No activity (dark gray)
                NSColor(hex: "#161b22") ?? .black, // Low activity (dark green)
                NSColor(hex: "#161b22") ?? .black, // Medium activity (green)
                NSColor(hex: "#161b22") ?? .black, // High activity (light green)
                NSColor(hex: "#161b22") ?? .black  // Very high activity (bright green)
                ]

        let cornerRadius: CGFloat = 4.0

        for i in 0..<totalBlocks {
            let xPosition = leftPadding + (CGFloat(i) * (blockSize.width + spacing))
            let rect = NSRect(x: xPosition, y: 3.0, width: blockSize.width, height: blockSize.height)
            let path = NSBezierPath(roundedRect: rect, xRadius: cornerRadius, yRadius: cornerRadius)
            
            colors[i].setFill()
            path.fill()
        }

        image.unlockFocus()
        return image
    }

}

extension NSColor {
    convenience init?(hex: String) {
        var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: "")

        var rgb: UInt64 = 0
        guard Scanner(string: hexSanitized).scanHexInt64(&rgb) else { return nil }

        self.init(
            red: CGFloat((rgb & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgb & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgb & 0x0000FF) / 255.0,
            alpha: 1.0
        )
    }
}
