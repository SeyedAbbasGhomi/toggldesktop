//
//  TagTokenView.swift
//  TogglDesktop
//
//  Created by Nghia Tran on 4/5/19.
//  Copyright © 2019 Alari. All rights reserved.
//

import Cocoa

final class TagTokenView: NSView {

    // MARK: OUTLET

    @IBOutlet weak var boxContainerView: NSBox!
    @IBOutlet weak var titleLabel: NSTextField!
    @IBOutlet weak var closeButton: CursorButton!

    // MARK: Views

    override func awakeFromNib() {
        super.awakeFromNib()

        initCommon()
        initTracking()
    }

    deinit {
        trackingAreas.forEach {
            removeTrackingArea($0)
        }
    }

    func render(_ tag: Tag) {
        titleLabel.stringValue = tag.name
    }

    override func mouseExited(with event: NSEvent) {
        super.mouseExited(with: event)
        boxContainerView.animator().alphaValue = 1.0
        closeButton.animator().alphaValue = 0.0
    }

    override func mouseEntered(with event: NSEvent) {
        super.mouseEntered(with: event)
        boxContainerView.animator().alphaValue = 0.0
        closeButton.animator().alphaValue = 1.0
    }

    fileprivate func initTracking() {
        let trackingArea = NSTrackingArea(rect: bounds,
                                          options: [.activeInActiveApp, .inVisibleRect, .mouseEnteredAndExited],
                                          owner: self,
                                          userInfo: nil)
        addTrackingArea(trackingArea)
    }
}

// MARK: Private

extension TagTokenView {

    fileprivate func initCommon() {
        boxContainerView.alphaValue = 1
        closeButton.alphaValue = 0
        closeButton.cursor = .pointingHand
    }
}
