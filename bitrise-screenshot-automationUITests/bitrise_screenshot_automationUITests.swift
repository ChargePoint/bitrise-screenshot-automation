//
//  bitrise_screenshot_automationUITests.swift
//  bitrise-screenshot-automationUITests
//
//  Created by Alexander Botkin on 4/20/20.
//  Copyright © 2020 ChargePoint, Inc. All rights reserved.
//

import XCTest

class bitrise_screenshot_automationUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testMainViewScreenshot() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()

        // Let's ensure the view has appeared by using the accessibility identifier
        // we set up in the storyboard
        let darkMapVCView = app.otherElements["Dark Map View"];
        XCTAssertTrue(darkMapVCView.waitForExistence(timeout: 3))

        // Now let's get a screenshot & save it to the xcresult as an attachment
        self.saveScreenshot("MyAutomation_darkMapView")
    }

    func testTodayWidgetScreenshot() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()

        let springboard = XCUIApplication(bundleIdentifier: "com.apple.springboard")
        springboard.activate()

        springboard.swipeRight()
        springboard.swipeRight()

        let editButton = springboard.buttons.firstMatch
        XCTAssertTrue(editButton.waitForExistence(timeout: 3))
        editButton.tap()

        let widgetNamePredicate = NSPredicate(format: "label CONTAINS[c] 'TodayWidget'")
        let addWidgetCells = springboard.cells.matching(widgetNamePredicate)
        addWidgetCells.buttons.firstMatch.tap()

        let doneButton = springboard.navigationBars.buttons.element(boundBy: 1)
        doneButton.tap()

        let todayLabel = springboard.staticTexts["Today Label"]
        XCTAssertTrue(todayLabel.waitForExistence(timeout: 3))
        
        self.saveScreenshot("MyAutomation_todayWidget")

        app.activate()
    }

//    func testLaunchPerformance() throws {
//        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
//            // This measures how long it takes to launch your application.
//            measure(metrics: [XCTOSSignpostMetric.applicationLaunch]) {
//                XCUIApplication().launch()
//            }
//        }
//    }
}
