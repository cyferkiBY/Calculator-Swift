//
//  TurboCalculatorUITests.swift
//  TurboCalculatorUITests
//
//  Created by Katya Bay on 09.09.2023.
//

import XCTest

final class TurboCalculatorUITests: XCTestCase {
    
    let app = XCUIApplication()
    let device = XCUIDevice.shared
    
    override func setUpWithError() throws {
        continueAfterFailure = false
        device.orientation = UIDeviceOrientation.portrait
        app.launch()
    }
    
    override func tearDownWithError() throws {
        app.terminate()
    }
    
    func testAllNumericButtonAreDisplayedOnTheDisplay() throws {
        app.buttons["one"].tap()
        app.buttons["two"].tap()
        app.buttons["three"].tap()
        app.buttons["four"].tap()
        app.buttons["five"].tap()
        app.buttons["six"].tap()
        app.buttons["seven"].tap()
        app.buttons["eight"].tap()
        app.buttons["nine"].tap()
        app.buttons["zero"].tap()
        
        XCTAssert(app.staticTexts["1234567890"].exists)
    }
    
    func testButtonCleanClearsResult() throws {
        app.buttons["one"].tap()
        app.buttons["two"].tap()
        app.buttons["three"].tap()
        app.buttons["plus"].tap()
        app.buttons["two"].tap()
        app.buttons["total"].tap()
        app.buttons["clean"].tap()
        
        let result = app.buttons["result"].staticTexts.element.label
        XCTAssertEqual(result, "0")
    }
    
    func testOnePlusTwoIsThree() throws {
        app.buttons["one"].tap()
        app.buttons["plus"].tap()
        app.buttons["two"].tap()
        app.buttons["total"].tap()
        
        let result = app.buttons["result"].staticTexts.element.label
        XCTAssertEqual(result, "3")
    }
    
    func testSixMinusFourIsTwo() throws {
        app.buttons["six"].tap()
        app.buttons["minus"].tap()
        app.buttons["four"].tap()
        app.buttons["total"].tap()
        
        let result = app.buttons["result"].staticTexts.element.label
        XCTAssertEqual(result, "2")
    }
    
    func testTwoMultiplyThreeIsSix() throws {
        app.buttons["two"].tap()
        app.buttons["multiply"].tap()
        app.buttons["three"].tap()
        app.buttons["total"].tap()
        
        let result = app.buttons["result"].staticTexts.element.label
        XCTAssertEqual(result, "6")
    }
    
    func testTenDevideByFiveIsTwo() throws {
        app.buttons["one"].tap()
        app.buttons["zero"].tap()
        app.buttons["devision"].tap()
        app.buttons["five"].tap()
        app.buttons["total"].tap()
        
        let result = app.buttons["result"].staticTexts.element.label
        XCTAssertEqual(result, "2")
    }
    
    func testDevideByZeroDisplaysAlert() throws {
        app.buttons["one"].tap()
        app.buttons["two"].tap()
        app.buttons["devision"].tap()
        app.buttons["zero"].tap()
        app.buttons["total"].tap()
        
        XCTAssert(app.alerts["Ошибка"].descendants(matching:.staticText)["На ноль делить нельзя!"].waitForExistence(timeout: 1.0))
    }
}
