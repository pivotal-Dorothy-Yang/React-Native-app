//
//  SectionListActivityTest.swift
//  testProject
//
//  Created by Pivotal DX209 on 2017-07-17.
//  Copyright © 2017 Facebook. All rights reserved.
//

import XCTest

func sectionListIsLaunched() {
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
	
	
	
	EarlGrey.select(elementWithMatcher: grey_allOf([grey_accessibilityID("Buttons_Next"), grey_accessibilityTrait(UIAccessibilityTraitButton)]))
		.perform(grey_tap())
	
	let flatListPopulated = GREYCondition(name: "Wait for Flat List Screen to populate", block: {_ in
		var error: NSError?
		
		EarlGrey.select(elementWithMatcher: grey_accessibilityLabel("Item 1")).assert(with: grey_sufficientlyVisible(), error: &error)
		return error == nil
	}).waitWithTimeout(seconds: 10.0)
	
	GREYAssertTrue(flatListPopulated, reason: "Item 1 not found!")
	EarlGrey.select(elementWithMatcher: grey_allOf([grey_accessibilityLabel("Flat List"), grey_accessibilityTrait(UIAccessibilityTraitHeader)])).assert(with: grey_sufficientlyVisible())
	
	
	
	EarlGrey.select(elementWithMatcher: grey_allOf([grey_accessibilityID("Flat_List_Next"), grey_accessibilityTrait(UIAccessibilityTraitButton)]))
		.perform(grey_tap())
	
	let sectionListPopulated = GREYCondition(name: "Wait for Section List Screen to populate", block: {_ in
		var error: NSError?
		
		EarlGrey.select(elementWithMatcher: grey_accessibilityLabel("Data 1")).assert(with: grey_sufficientlyVisible(), error: &error)
		return error == nil
	}).waitWithTimeout(seconds: 10.0)
	
	GREYAssertTrue(sectionListPopulated, reason: "Data 1 not found!")
	EarlGrey.select(elementWithMatcher: grey_allOf([grey_accessibilityLabel("Section List"), grey_accessibilityTrait(UIAccessibilityTraitHeader)])).assert(with: grey_sufficientlyVisible())

}


class SectionListActivityTest: XCTestCase {
    
    override static func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
			sectionListIsLaunched()
			//OnPressNextFlatListScreenIsLaunched()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
	func testAllElementsAreVisible() {
		EarlGrey.select(elementWithMatcher: grey_allOf([grey_accessibilityTrait(UIAccessibilityTraitHeader), grey_accessibilityLabel("Section List")])).assert(with: grey_sufficientlyVisible())
		EarlGrey.select(elementWithMatcher: grey_allOf([grey_accessibilityID("header-back"), grey_accessibilityLabel("Flat List")])).assert(with: grey_sufficientlyVisible())
		EarlGrey.select(elementWithMatcher: grey_accessibilityLabel("D")).assert(with: grey_sufficientlyVisible())
		EarlGrey.select(elementWithMatcher: grey_accessibilityID("section Data 1")).assert(with: grey_sufficientlyVisible())
		EarlGrey.select(elementWithMatcher: grey_accessibilityID("section Data 2")).assert(with: grey_sufficientlyVisible())
		EarlGrey.select(elementWithMatcher: grey_accessibilityID("section Data 3")).assert(with: grey_sufficientlyVisible())
		EarlGrey.select(elementWithMatcher: grey_accessibilityID("section Data 4")).assert(with: grey_sufficientlyVisible())
		EarlGrey.select(elementWithMatcher: grey_accessibilityLabel("I")).assert(with: grey_sufficientlyVisible())
		EarlGrey.select(elementWithMatcher: grey_accessibilityID("section Item 1")).assert(with: grey_sufficientlyVisible())
		EarlGrey.select(elementWithMatcher: grey_accessibilityID("section Item 2")).assert(with: grey_sufficientlyVisible())
		EarlGrey.select(elementWithMatcher: grey_accessibilityID("section Item 3")).assert(with: grey_sufficientlyVisible())
		EarlGrey.select(elementWithMatcher: grey_accessibilityID("section Item 4")).assert(with: grey_sufficientlyVisible())
		EarlGrey.select(elementWithMatcher: grey_accessibilityID("section Item 5")).assert(with: grey_sufficientlyVisible())
		EarlGrey.select(elementWithMatcher: grey_accessibilityLabel("T")).assert(with: grey_sufficientlyVisible())
		EarlGrey.select(elementWithMatcher: grey_accessibilityID("section Task 1")).assert(with: grey_sufficientlyVisible())
		EarlGrey.select(elementWithMatcher: grey_accessibilityID("section Task 2")).assert(with: grey_sufficientlyVisible())
		EarlGrey.select(elementWithMatcher: grey_accessibilityID("section Task 3")).assert(with: grey_sufficientlyVisible())
		EarlGrey.select(elementWithMatcher: grey_allOf([grey_accessibilityID("Section_List_Next"), grey_accessibilityTrait(UIAccessibilityTraitButton)])).assert(with: grey_sufficientlyVisible())
	}
	
	func testOnPressNextAndBackPickerScreenAndSectionListScreenLoad() {
		EarlGrey.select(elementWithMatcher: grey_allOf([grey_accessibilityID("Section_List_Next"), grey_accessibilityTrait(UIAccessibilityTraitButton)]))
			.perform(grey_tap())
		
		let populated = GREYCondition(name: "Wait for Picker Screen to populate", block: {_ in
			var error: NSError?
			EarlGrey.select(elementWithMatcher: grey_allOf([grey_accessibilityLabel("Days of the Week"), grey_accessibilityTrait(UIAccessibilityTraitStaticText)])).assert(grey_sufficientlyVisible(), error: &error)
			return error == nil
		}).waitWithTimeout(seconds: 10.0)
		
		GREYAssertTrue(populated, reason: "Days of the Week not found!")
		EarlGrey.select(elementWithMatcher: grey_allOf([grey_accessibilityLabel("Picker"), grey_accessibilityTrait(UIAccessibilityTraitHeader)])).assert(with: grey_sufficientlyVisible())
		
		
		
		EarlGrey.select(elementWithMatcher: grey_allOf([grey_accessibilityID("header-back"), grey_accessibilityLabel("Section List")])).perform(grey_tap())
		
		let textinputpopulated = GREYCondition(name: "Wait for Section List Screen to populate", block: {_ in
			var error: NSError?
			EarlGrey.select(elementWithMatcher: grey_accessibilityID("Data 1")).assert(with: grey_sufficientlyVisible(), error: &error)
			return error == nil
		}).waitWithTimeout(seconds: 10.0)
		
		GREYAssertTrue(textinputpopulated, reason: "Data 1 not found!")
		EarlGrey.select(elementWithMatcher: grey_allOf([grey_accessibilityLabel("Section List"), grey_accessibilityTrait(UIAccessibilityTraitHeader)])).assert(with: grey_sufficientlyVisible())

	}
	
}
