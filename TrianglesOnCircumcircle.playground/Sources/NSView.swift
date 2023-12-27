import AppKit

// MARK: - NSView

/// Provides additional functionality for drawing points and lines on the view.
public extension NSView {
    /// Draws points on the view at the specified locations with the given color.
    /// - Parameters:
    ///   - points: An array of CGPoint representing the locations of the points.
    ///   - color: The color of the points. Default is black.
    func drawPoint(from points: [CGPoint], withColor color: NSColor = .black) {
        for point in points {
            let pointView = NSView(frame: CGRect(x: point.x - 5, y: point.y - 5, width: 10, height: 10))
            pointView.wantsLayer = true
            pointView.layer?.cornerRadius = pointView.frame.width / 2
            pointView.layer?.backgroundColor = color.cgColor
            self.addSubview(pointView)
        }
    }
    
    /// Removes all point views from the view.
    func removePointViews() {
        for subview in subviews {
            if subview.layer?.backgroundColor != nil {
                subview.removeFromSuperview()
            }
        }
    }
    
    /// Draws lines connecting consecutive points on the view with the specified color.
    /// - Parameters:
    ///   - points: An array of CGPoint representing the locations of the points.
    ///   - color: The color of the lines. Default is black.
    func drawLines(from points: [CGPoint], withColor color: NSColor = .black) {
        guard points.count >= 2 else { return }
        
        for i in 0..<points.count - 1 {
            let startPoint = points[i]
            let endPoint = points[i + 1]
            
            let linePath = NSBezierPath()
            linePath.move(to: startPoint)
            linePath.line(to: endPoint)
            
            let lineLayer = CAShapeLayer()
            lineLayer.path = linePath.cgPath
            lineLayer.strokeColor = color.cgColor
            lineLayer.lineWidth = 2.0 // You can adjust the line width as needed
            
            self.layer?.addSublayer(lineLayer)
        }
        
        // Connect the last point to the first one to close the shape
        if let firstPoint = points.first, let lastPoint = points.last, points.count > 2 {
            let linePath = NSBezierPath()
            linePath.move(to: lastPoint)
            linePath.line(to: firstPoint)
            
            let lineLayer = CAShapeLayer()
            lineLayer.path = linePath.cgPath
            lineLayer.strokeColor = color.cgColor
            lineLayer.lineWidth = 2.0 // You can adjust the line width as needed
            
            self.layer?.addSublayer(lineLayer)
        }
    }
    
    /// Removes lines connecting consecutive points from the view.
    func removeLines() {
        if let sublayers = layer?.sublayers {
            for sublayer in sublayers {
                if sublayer is CAShapeLayer {
                    sublayer.removeFromSuperlayer()
                }
            }
        }
    }
}
