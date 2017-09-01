//
//  ButtonsActivityTest.swift
//  testProject
//
//  Created by Pivotal DX209 on 2017-07-13.
//  Copyright © 2017 Facebook. All rights reserved.
//

import XCTest

func OnPressNextButtonsScreenIsLaunched() {
	EarlGrey.select(elementWithMatcher: grey_allOf([grey_accessibilityID("Text_Input_Next"), grey_accessibilityTrait(UIAccessibilityTraitButton)]))
		.assert(with: grey_sufficientlyVisible())
	EarlGrey.select(elementWithMatcher: grey_allOf([grey_accessibilityID("Text_Input_Next"), grey_accessibilityTrait(UIAccessibilityTraitButton)]))
		.perform(grey_tap())
	
	let populated = GREYCondition(name: "Wait for Buttons Screen to populate", block: {_ in
		var error: NSError?
		
		EarlGrey.select(elementWithMatcher: grey_allOf([grey_accessibilityID("button_3_id"), grey_accessibilityTrait(UIAccessibilityTraitButton)])).assert(grey_sufficientlyVisible(), error: &error)
		
		return error == nil
	}).waitWithTimeout(seconds: 10.0)
	GREYAssertTrue(populated, reason: "Button 3 not found!")
	
	EarlGrey.select(elementWithMatcher: grey_allOf([grey_accessibilityLabel("Buttons"), grey_accessibilityTrait(UIAccessibilityTraitHeader)])).assert(with: grey_sufficientlyVisible())
	
	
}


class ButtonsActivityTest: XCTestCase {
    
    override static func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
			OnPressNextButtonsScreenIsLaunched()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
		func testAllElementsAreVisible() {
			EarlGrey.select(elementWithMatcher: grey_allOf([grey_accessibilityLabel("Buttons"), grey_accessibilityTrait(UIAccessibilityTraitHeader)])).assert(with: grey_sufficientlyVisible())
			EarlGrey.select(elementWithMatcher: grey_allOf([grey_accessibilityID("header-back"), grey_accessibilityLabel("Text Input")])).assert(with: grey_sufficientlyVisible())
			EarlGrey.select(elementWithMatcher: grey_allOf([grey_accessibilityID("button_1_id"), grey_accessibilityTrait(UIAccessibilityTraitButton)])).assert(with: grey_sufficientlyVisible())
			EarlGrey.select(elementWithMatcher: grey_allOf([grey_accessibilityID("button_2_id"), grey_accessibilityTrait(UIAccessibilityTraitButton)])).assert(with: grey_sufficientlyVisible())
			EarlGrey.select(elementWithMatcher: grey_allOf([grey_accessibilityID("button_3_id"), grey_accessibilityTrait(UIAccessibilityTraitButton)])).assert(with: grey_sufficientlyVisible())
			EarlGrey.select(elementWithMatcher: grey_allOf([grey_accessibilityID("button_4_id"), grey_accessibilityTrait(UIAccessibilityTraitButton)])).assert(with: grey_sufficientlyVisible())
			EarlGrey.select(elementWithMatcher: grey_allOf([grey_accessibilityID("button_5_id"), grey_accessibilityTrait(UIAccessibilityTraitButton)])).assert(with: grey_sufficientlyVisible())
			EarlGrey.select(elementWithMatcher: grey_allOf([grey_accessibilityID("button_6_id"), grey_accessibilityTrait(UIAccessibilityTraitButton)])).assert(with: grey_sufficientlyVisible())
			EarlGrey.select(elementWithMatcher: grey_allOf([grey_accessibilityID("Buttons_Next"), grey_accessibilityTrait(UIAccessibilityTraitButton)])).assert(with: grey_sufficientlyVisible())
		
			EarlGrey.select(elementWithMatcher: grey_accessibilityTrait(UIAccessibilityTraitImage)).assert(with: grey_sufficientlyVisible())
			//try creating a custom matcher to assert that the URI is correct
		}
	
		func testButton1AlertIsVisible() {
			EarlGrey.select(elementWithMatcher: grey_allOf([grey_accessibilityID("button_1_id"), grey_accessibilityTrait(UIAccessibilityTraitButton)])).perform(grey_tap())
			EarlGrey.select(elementWithMatcher: grey_allOf([grey_accessibilityTrait(UIAccessibilityTraitStaticText), grey_text("You pressed button 1!")])).assert(with: grey_sufficientlyVisible())
			EarlGrey.select(elementWithMatcher: grey_allOf([grey_accessibilityLabel("OK"), grey_accessibilityTrait(UIAccessibilityTraitButton)])).assert(with: grey_sufficientlyVisible())
				.perform(grey_tap())
		}
	
		func testButton2AlertIsVisible() {
			EarlGrey.select(elementWithMatcher: grey_allOf([grey_accessibilityID("button_2_id"), grey_accessibilityTrait(UIAccessibilityTraitButton)])).perform(grey_tap())
			EarlGrey.select(elementWithMatcher: grey_allOf([grey_accessibilityTrait(UIAccessibilityTraitStaticText), grey_text("You pressed button 2!")])).assert(with: grey_sufficientlyVisible())
			EarlGrey.select(elementWithMatcher: grey_allOf([grey_accessibilityLabel("OK"), grey_accessibilityTrait(UIAccessibilityTraitButton)])).assert(with: grey_sufficientlyVisible())
				.perform(grey_tap())
		}
	
		func testButton3AlertIsVisible() {
			EarlGrey.select(elementWithMatcher: grey_allOf([grey_accessibilityID("button_3_id"), grey_accessibilityTrait(UIAccessibilityTraitButton)])).perform(grey_tap())
			EarlGrey.select(elementWithMatcher: grey_allOf([grey_accessibilityTrait(UIAccessibilityTraitStaticText), grey_text("You pressed button 3!")])).assert(with: grey_sufficientlyVisible())
			EarlGrey.select(elementWithMatcher: grey_allOf([grey_accessibilityLabel("OK"), grey_accessibilityTrait(UIAccessibilityTraitButton)])).assert(with: grey_sufficientlyVisible())
				.perform(grey_tap())
		}
	
		func testButton4AlertIsVisible() {
			EarlGrey.select(elementWithMatcher: grey_allOf([grey_accessibilityID("button_4_id"), grey_accessibilityTrait(UIAccessibilityTraitButton)])).perform(grey_tap())
			EarlGrey.select(elementWithMatcher: grey_allOf([grey_accessibilityTrait(UIAccessibilityTraitStaticText), grey_text("You pressed button 4!")])).assert(with: grey_sufficientlyVisible())
			EarlGrey.select(elementWithMatcher: grey_allOf([grey_accessibilityLabel("OK"), grey_accessibilityTrait(UIAccessibilityTraitButton)])).assert(with: grey_sufficientlyVisible())
				.perform(grey_tap())
		}

		func testButton5AlertIsVisible() {
			EarlGrey.select(elementWithMatcher: grey_allOf([grey_accessibilityID("button_5_id"), grey_accessibilityTrait(UIAccessibilityTraitButton)])).perform(grey_tap())
			EarlGrey.select(elementWithMatcher: grey_allOf([grey_accessibilityTrait(UIAccessibilityTraitStaticText), grey_text("You pressed button 5!")])).assert(with: grey_sufficientlyVisible())
			EarlGrey.select(elementWithMatcher: grey_allOf([grey_accessibilityLabel("OK"), grey_accessibilityTrait(UIAccessibilityTraitButton)])).assert(with: grey_sufficientlyVisible())
				.perform(grey_tap())
		}
	
		func testButton6AlertIsVisible() {
			EarlGrey.select(elementWithMatcher: grey_allOf([grey_accessibilityID("button_6_id"), grey_accessibilityTrait(UIAccessibilityTraitButton)])).perform(grey_tap())
			EarlGrey.select(elementWithMatcher: grey_allOf([grey_accessibilityTrait(UIAccessibilityTraitStaticText), grey_text("You pressed button 6!")])).assert(with: grey_sufficientlyVisible())
			EarlGrey.select(elementWithMatcher: grey_allOf([grey_accessibilityLabel("OK"), grey_accessibilityTrait(UIAccessibilityTraitButton)])).assert(with: grey_sufficientlyVisible())
				.perform(grey_tap())
		}
	
		func testOnPressNextAndBackFlatListScreenAndButtonsScreenLoad() {
			EarlGrey.select(elementWithMatcher: grey_allOf([grey_accessibilityID("Buttons_Next"), grey_accessibilityTrait(UIAccessibilityTraitButton)]))
				.perform(grey_tap())
		
			let populated = GREYCondition(name: "Wait for Flat List Screen to populate", block: {_ in
				var error: NSError?
				EarlGrey.select(elementWithMatcher: grey_allOf([grey_accessibilityLabel("Item 1"), grey_accessibilityTrait(UIAccessibilityTraitStaticText)])).assert(grey_sufficientlyVisible(), error: &error)
				return error == nil
			}).waitWithTimeout(seconds: 10.0)
		
			GREYAssertTrue(populated, reason: "Item 1 not found!")
			EarlGrey.select(elementWithMatcher: grey_allOf([grey_accessibilityLabel("Flat List"), grey_accessibilityTrait(UIAccessibilityTraitHeader)])).assert(with: grey_sufficientlyVisible())
		
		
		
			EarlGrey.select(elementWithMatcher: grey_allOf([grey_accessibilityID("header-back"), grey_accessibilityLabel("Buttons")])).perform(grey_tap())
		
			let textinputpopulated = GREYCondition(name: "Wait for Buttons Screen to populate", block: {_ in
				var error: NSError?
				EarlGrey.select(elementWithMatcher: grey_accessibilityID("button_1_id")).assert(with: grey_sufficientlyVisible(), error: &error)
				return error == nil
			}).waitWithTimeout(seconds: 10.0)
		
			GREYAssertTrue(textinputpopulated, reason: "button 1 not found!")
			EarlGrey.select(elementWithMatcher: grey_allOf([grey_accessibilityLabel("Buttons"), grey_accessibilityTrait(UIAccessibilityTraitHeader)])).assert(with: grey_sufficientlyVisible())
		}

}
