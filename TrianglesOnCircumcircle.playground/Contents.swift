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
            }
            
            // Check if the subview has a tag of -1 (assumed to be the coordinatePlaneView)
            if let view = subview.viewWithTag(-1) {
                // Assigns to the global coordinatePlaneView.
                coordinatePlaneView = view
                
                // Calculate the circumcenter based on the bounds of the coordinatePlaneView
                circumcenter = CGPoint(x: coordinatePlaneView.bounds.width / 2,
                                       y: coordinatePlaneView.bounds.height / 2)
                
                // Setup Triangles On Coordinate Plane
            }
        }
    }
}

// Present the view in Playground
PlaygroundPage.current.liveView = views[0] as! NSView

