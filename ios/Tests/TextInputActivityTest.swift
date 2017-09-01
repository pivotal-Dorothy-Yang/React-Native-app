//
//  TextInputActivityTest.swift
//  testProject
//
//  Created by Pivotal DX209 on 2017-07-13.
//  Copyright © 2017 Facebook. All rights reserved.
//

import XCTest

class TextInputActivityTest: XCTestCase {
	
	override static func setUp() {
		// Put setup code here. This method is called before the invocation of each test method in the class.
		super.setUp()
	}
	
	override func tearDown() {
		// Put teardown code here. This method is called after the invocation of each test method in the class.
		super.tearDown()
	}
	
	func testAllUIElementsVisibleUsingID() {
		EarlGrey.select(elementWithMatcher: grey_allOf([grey_accessibilityTrait(UIAccessibilityTraitHeader), grey_accessibilityLabel("Text Input")]))
			.assert(with: grey_sufficientlyVisible())
		EarlGrey.select(elementWithMatcher: grey_accessibilityID("input_1_id"))
			.assert(with: grey_sufficientlyVisible())
		EarlGrey.select(elementWithMatcher: grey_accessibilityID("input_2_id"))
			.assert(with: grey_sufficientlyVisible())
		EarlGrey.select(elementWithMatcher: grey_accessibilityID("input_3_id"))
			.assert(with: grey_sufficientlyVisible())
		EarlGrey.select(elementWithMatcher: grey_accessibilityTrait(UIAccessibilityTraitButton))
			.assert(with: grey_sufficientlyVisible())
		EarlGrey.select(elementWithMatcher: grey_allOf([grey_accessibilityTrait(UIAccessibilityTraitButton), grey_accessibilityID("Text_Input_Next")])).assert(with: grey_sufficientlyVisible())
	}
	
	func testAllUIElementsVisibleUsingLabel() {
		EarlGrey.select(elementWithMatcher: grey_accessibilityTrait(UIAccessibilityTraitHeader)).assert(with: grey_sufficientlyVisible())
		EarlGrey.select(elementWithMatcher: grey_accessibilityLabel("Type your text here!"))
			.assert(with: grey_sufficientlyVisible())
		EarlGrey.select(elementWithMatcher: grey_accessibilityLabel("col 1"))
			.assert(with: grey_sufficientlyVisible())
		EarlGrey.select(elementWithMatcher: grey_accessibilityLabel("col 2"))
			.assert(with: grey_sufficientlyVisible())
		EarlGrey.select(elementWithMatcher: grey_allOf([grey_accessibilityID("Text_Input_Next"), grey_accessibilityTrait(UIAccessibilityTraitButton)]))
			.assert(with: grey_sufficientlyVisible())
	}
	
	func testInputText1AndClearTextAndVerifyIsNotVisible() {
		let text1 = "This is a sample with some text"
		
		EarlGrey.select(elementWithMatcher: grey_accessibilityID("input_1_id")).perform(grey_tap())
			.perform(grey_typeText(text1))
		EarlGrey.select(elementWithMatcher: grey_allOf([grey_kindOfClass(UIButton.self), grey_accessibilityLabel("Clear text")])).perform(grey_tap())
		EarlGrey.select(elementWithMatcher: grey_accessibilityValue(text1)).assert(with: grey_notVisible())
	}

	func testInputText1AndVerifyIsVisible() {
		let text1 = "This is a sample with some text"
		
		EarlGrey.select(elementWithMatcher: grey_accessibilityID("input_1_id")).perform(grey_tap())
			.perform(grey_typeText(text1))
		EarlGrey.select(elementWithMatcher: grey_allOf([grey_accessibilityValue(text1), grey_accessibilityID("input_1_id")])).assert(with: grey_sufficientlyVisible())
	}
	
	func testInputText2AndVerifyIsVisible() {
		let text2 = "hello"
		
		EarlGrey.select(elementWithMatcher: grey_accessibilityID("input_2_id")).perform(grey_tap())
			.perform(grey_typeText(text2))

		EarlGrey.select(elementWithMatcher: grey_allOf([grey_accessibilityValue(text2), grey_accessibilityID("input_2_id")])).assert(with: grey_sufficientlyVisible())
	}
	
	func testInputText3AndVerifyIsVisible() {
		let text3 = "blah blah blah"

		EarlGrey.select(elementWithMatcher: grey_accessibilityID("input_3_id")).perform(grey_tap())
			.perform(grey_typeText(text3))
		
		EarlGrey.select(elementWithMatcher: grey_allOf([grey_accessibilityValue(text3), grey_accessibilityID("input_3_id")])).assert(with: grey_sufficientlyVisible())
	}
	
	
	func testOnPressNextAndBackButtonsScreenAndTextInputScreenLoad() {
		EarlGrey.select(elementWithMatcher: grey_allOf([grey_accessibilityID("Text_Input_Next"), grey_accessibilityTrait(UIAccessibilityTraitButton)]))
			.perform(grey_tap())
		
		let populated = GREYCondition(name: "Wait for Buttons Screen to populate", block: {_ in
			var error: NSError?
			EarlGrey.select(elementWithMatcher: grey_allOf([grey_accessibilityID("button_3_id"), grey_accessibilityTrait(UIAccessibilityTraitButton)])).assert(grey_sufficientlyVisible(), error: &error)
			return error == nil
		}).waitWithTimeout(seconds: 10.0)
		
		GREYAssertTrue(populated, reason: "Button 3 not found!")
		EarlGrey.select(elementWithMatcher: grey_allOf([grey_accessibilityLabel("Buttons"), grey_accessibilityTrait(UIAccessibilityTraitHeader)])).assert(with: grey_sufficientlyVisible())

		
		
		EarlGrey.select(elementWithMatcher: grey_allOf([grey_accessibilityID("header-back"), grey_accessibilityLabel("Text Input")])).perform(grey_tap())
		
		let textinputpopulated = GREYCondition(name: "Wait for Text Input Screen to populate", block: {_ in
			var error: NSError?
			EarlGrey.select(elementWithMatcher: grey_accessibilityID("input_2_id")).assert(with: grey_sufficientlyVisible(), error: &error)
			return error == nil
		}).waitWithTimeout(seconds: 10.0)

		GREYAssertTrue(textinputpopulated, reason: "Text input not found!")
		EarlGrey.select(elementWithMatcher: grey_allOf([grey_accessibilityLabel("Text Input"), grey_accessibilityTrait(UIAccessibilityTraitHeader)])).assert(with: grey_sufficientlyVisible())
	}

	
}
