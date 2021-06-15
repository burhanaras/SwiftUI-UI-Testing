//
//  UITestDemoUITests.swift
//  UITestDemoUITests
//
//  Created by Burhan Aras on 4.06.2021.
//

import XCTest

class UITestDemoUITests: XCTestCase {

    let app = XCUIApplication()
    
    override func setUpWithError() throws {
        continueAfterFailure = false
        app.launch()
    }


    func test_WelcomeText_Exists(){
        let label = app.staticTexts["Welcome to the world of UI Testing."]
        XCTAssert(label.exists)
    }
    
    func test_LoginButton_Exists(){
        let loginButton = app.buttons["loginButton"]
        XCTAssert(loginButton.exists)
        XCTAssertEqual(loginButton.label, "Login")
    }
    
    func test_LoginFormAppears_when_LoginButtonTapped(){
        // GIVEN: that we have a login button
        let loginButton = app.buttons["loginButton"]
        
        // WHEN: we tap login button
        loginButton.tap()
        
        // THEN: Navbar, usrname, password, title and dismiss buttons should be visible.
        let navBar = app.navigationBars.element
        XCTAssert(navBar.exists)
        
        let username = app.textFields["Username"]
        XCTAssert(username.exists)
        
        let password = app.secureTextFields["Password"]
        XCTAssert(password.exists)
        
        let loginNavBartitle = app.staticTexts["Login"]
        XCTAssert(loginNavBartitle.exists)
        
        let loginNow = app.buttons["loginNow"]
        XCTAssert(loginNow.exists)
        
        let dismiss = app.buttons["Dismiss"]
        XCTAssert(dismiss.exists)
    }
    
    func test_LoginDismiss_When_DismissButtonTapped(){
        // GIVEN: that we have a login button and dismiss button after login button is tapped
        let loginButton = app.buttons["loginButton"]
        loginButton.tap()
        let dismissButton = app.buttons["Dismiss"]
        
        // WHEN: dismiss button is tapped
        dismissButton.tap()
        
        // THEN: dismiss button should disappear
        XCTAssertFalse(dismissButton.waitForExistence(timeout: 0.5))
    }
    
    func test_Username(){
        // GIVEN: We have a login button and username textfield after login button is tapped
        let loginbutton  = app.buttons["loginButton"]
        loginbutton.tap()
        let username = app.textFields["Username"]
        
        // WHEN: User types text on username
        let textToType = "Selamun Aleykum"
        username.tap()
        username.typeText(textToType)
        
        // THEN: Username should have typed text
        XCTAssertEqual(username.value as! String, textToType)
    }
    
    func test_Password(){
        // GIVEN: We have a login button and pssword secure textfield after login button is tapped
        let loginbutton  = app.buttons["loginButton"]
        loginbutton.tap()
        let password = app.secureTextFields["Password"]
        
        // WHEN: User types text on username and password
        let username = app.textFields["Username"]
        username.tap()
        username.typeText("Selamun Aleykum")
        password.tap()
        app.keys["p"].tap()
        app.keys["a"].tap()
        app.keys["s"].tap()
        app.keys["s"].tap()
        app.keyboards.buttons["Return"].tap()
        
        // THEN: Username should have typed text
        XCTAssertEqual(password.value as! String, "••••")
    }
    
    func test_loginShouldFail_WhenUsernameAndPasswordIsEmpty(){
        // GIVEN: that we have a login button and login view after button is tapped
        let loginButton = app.buttons["loginButton"]
        loginButton.tap()
        let loginNow = app.buttons["loginNow"]
        
        // WHEN: User taps loginNow button with empty username and password
        loginNow.tap()
        
        // THEN: "Login Failed" alert should be shown. When OK is tapped, alert is dismissed
        XCTAssert(app.alerts.element.waitForExistence(timeout: 0.5))
        app.alerts.element.buttons["OK"].tap()
        XCTAssertFalse(app.alerts.element.exists)
    }
}
