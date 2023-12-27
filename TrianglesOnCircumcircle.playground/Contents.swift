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

// Present the view in Playground
PlaygroundPage.current.liveView = views[0] as! NSView

