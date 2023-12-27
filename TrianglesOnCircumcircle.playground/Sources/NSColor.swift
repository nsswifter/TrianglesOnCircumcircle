import AppKit

// MARK: - NSColor

/// Generates a random color.
public extension NSColor {
    /// Generates a random NSColor with random red, green, and blue components.
    ///
    /// - Returns: A random NSColor with alpha set to 1.0.
    static var random: NSColor {
        return NSColor(
            red: CGFloat.random(in: 0...1),
            green: CGFloat.random(in: 0...1),
            blue: CGFloat.random(in: 0...1),
            alpha: 1.0
        )
    }
}
