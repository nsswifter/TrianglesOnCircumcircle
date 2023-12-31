//: A Cocoa based Playground to present user interface

import AppKit
import PlaygroundSupport

// MARK: - Load Nib File of Main Bundle

private let nibFile = NSNib.Name("MyView")
private var topLevelObjects : NSArray?

Bundle.main.loadNibNamed(nibFile, owner:nil, topLevelObjects: &topLevelObjects)
private let views = (topLevelObjects as! Array<Any>).filter { $0 is NSView }

// MARK: - Global Properties

private var circumcenter = CGPoint()
private var coordinatePlaneView = NSView()

// MARK: - Setup Views

// Assuming MainView is the first view in the nib
if let mainView = views.first as? NSView {
    // Assuming MainView is the first view in the nib
    if let mainView = views.first as? NSView {
        // Iterate through subviews to find the imageView
        for subview in mainView.subviews {
            if let textField = subview as? NSTextField {
                // Assigns the text field itself as its delegate.
                textField.delegate = textField
            }
            
            // Check if the subview has a tag of -1 (assumed to be the coordinatePlaneView)
            if let view = subview.viewWithTag(-1) {
                // Assigns to the global coordinatePlaneView.
                coordinatePlaneView = view
                
                // Calculate the circumcenter based on the bounds of the coordinatePlaneView
                circumcenter = CGPoint(x: coordinatePlaneView.bounds.width / 2,
                                       y: coordinatePlaneView.bounds.height / 2)
                
                // Setup Triangles On Coordinate Plane
                refreshTrianglesOnCoordinatePlane(numberOfTriangles: 3)
            }
        }
    }
}

// MARK: - Methods

/// Refreshes the display of triangles on the coordinate plane.
///
/// - Parameters:
///   - numberOfTriangles: The number of triangles to generate and display.
func refreshTrianglesOnCoordinatePlane(numberOfTriangles: Int) {
    // Removes all Triangles from the view.
    coordinatePlaneView.removePointViews()
    coordinatePlaneView.removeLines()
    
    // Create an instance of CircumcircleTriangleGenerator
    let circumcircleTriangleGenerator = CircumcircleTriangleGenerator()
    // Generate points on the circumcircle using the CircumcircleTriangleGenerator
    let points = circumcircleTriangleGenerator.generateTriangles(circumcenter: circumcenter,
                                                                 circumradius: 100,
                                                                 numberOfTriangles: numberOfTriangles)
    
    // Iterate through the generated points
    for point in points {
        let color = NSColor.random
        coordinatePlaneView.drawPoint(from: point, withColor: color)
        coordinatePlaneView.drawLines(from: point, withColor: color)
    }
}

// MARK: - Text Field Value Did Change

extension NSView: NSTextFieldDelegate {
    /// Notifies the delegate that the text in the specified text field has changed.
    ///
    /// - Parameter obj: The notification containing the text field that changed.
    @available(OSX 10.10, *)
    public func controlTextDidChange(_ obj: Notification) {
        if let textField = obj.object as? NSTextField {
            // Refreshes the display of triangles on the coordinate plane based on the updated number of triangles.
            refreshTrianglesOnCoordinatePlane(numberOfTriangles: Int(textField.intValue))
        }
    }
}

// Present the view in Playground
PlaygroundPage.current.liveView = views[0] as! NSView

