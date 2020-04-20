//
//  XCTestCase+Screenshots.swift
//  bitrise-screenshot-automationUITests
//
//  Created by Alexander Botkin on 4/20/20.
//  Copyright © 2020 ChargePoint, Inc. All rights reserved.
//

import XCTest

extension XCTestCase {
    func saveScreenshot(_ name: String) {
        let screenshot = XCUIScreen.main.screenshot()

        let attachment = XCTAttachment(screenshot: screenshot)
        attachment.name = name
        attachment.lifetime = .keepAlways

        self.add(attachment)
    }
}
