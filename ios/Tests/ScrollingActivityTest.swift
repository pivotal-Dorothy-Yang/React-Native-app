//
//  ScrollingActivityTest.swift
//  testProject
//
//  Created by Pivotal DX209 on 2017-07-24.
//  Copyright © 2017 Facebook. All rights reserved.
//

import XCTest


func scrollingIsLaunched() {
	//buttons screen
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
	
	
	//flat list screen
	EarlGrey.select(elementWithMatcher: grey_allOf([grey_accessibilityID("Buttons_Next"), grey_accessibilityTrait(UIAccessibilityTraitButton)]))
		.perform(grey_tap())
	
	let flatListPopulated = GREYCondition(name: "Wait for Flat List Screen to populate", block: {_ in
		var error: NSError?
		
		EarlGrey.select(elementWithMatcher: grey_accessibilityLabel("Item 1")).assert(with: grey_sufficientlyVisible(), error: &error)
		return error == nil
	}).waitWithTimeout(seconds: 10.0)
	
	GREYAssertTrue(flatListPopulated, reason: "Item 1 not found!")
	EarlGrey.select(elementWithMatcher: grey_allOf([grey_accessibilityLabel("Flat List"), grey_accessibilityTrait(UIAccessibilityTraitHeader)])).assert(with: grey_sufficientlyVisible())
	
	
	//section list screen
	EarlGrey.select(elementWithMatcher: grey_allOf([grey_accessibilityID("Flat_List_Next"), grey_accessibilityTrait(UIAccessibilityTraitButton)]))
		.perform(grey_tap())
	
	let sectionListPopulated = GREYCondition(name: "Wait for Section List Screen to populate", block: {_ in
		var error: NSError?
		
		EarlGrey.select(elementWithMatcher: grey_accessibilityLabel("Data 1")).assert(with: grey_sufficientlyVisible(), error: &error)
		return error == nil
	}).waitWithTimeout(seconds: 10.0)
	
	GREYAssertTrue(sectionListPopulated, reason: "Data 1 not found!")
	EarlGrey.select(elementWithMatcher: grey_allOf([grey_accessibilityLabel("Section List"), grey_accessibilityTrait(UIAccessibilityTraitHeader)])).assert(with: grey_sufficientlyVisible())
	
	
	//picker screen
	EarlGrey.select(elementWithMatcher: grey_allOf([grey_accessibilityID("Section_List_Next"), grey_accessibilityTrait(UIAccessibilityTraitButton)]))
		.perform(grey_tap())
	
	let pickerPopulated = GREYCondition(name: "Wait for Picker Screen to populate", block: {_ in
		var error: NSError?
		EarlGrey.select(elementWithMatcher: grey_allOf([grey_accessibilityLabel("Days of the Week"), grey_accessibilityTrait(UIAccessibilityTraitStaticText)])).assert(grey_sufficientlyVisible(), error: &error)
		return error == nil
	}).waitWithTimeout(seconds: 10.0)
	
	GREYAssertTrue(pickerPopulated, reason: "Days of the Week not found!")
	EarlGrey.select(elementWithMatcher: grey_allOf([grey_accessibilityLabel("Picker"), grey_accessibilityTrait(UIAccessibilityTraitHeader)])).assert(with: grey_sufficientlyVisible())
	
	
	//switch screen
	EarlGrey.select(elementWithMatcher: grey_allOf([grey_accessibilityID("Picker_Next"), grey_accessibilityTrait(UIAccessibilityTraitButton)]))
		.perform(grey_tap())
	
	let switchPopulated = GREYCondition(name: "Wait for Switch Screen to populate", block: {_ in
		var error: NSError?
		EarlGrey.select(elementWithMatcher: grey_allOf([grey_accessibilityLabel("ON"), grey_accessibilityTrait(UIAccessibilityTraitStaticText)])).assert(grey_sufficientlyVisible(), error: &error)
		return error == nil
	}).waitWithTimeout(seconds: 10.0)
	
	GREYAssertTrue(switchPopulated, reason: "Switches were not found!")
	EarlGrey.select(elementWithMatcher: grey_allOf([grey_accessibilityLabel("Switch"), grey_accessibilityTrait(UIAccessibilityTraitHeader)])).assert(with: grey_sufficientlyVisible())
	
	
	
	//slider screen
	EarlGrey.select(elementWithMatcher: grey_allOf([grey_accessibilityID("Switch_Next"), grey_accessibilityTrait(UIAccessibilityTraitButton)]))
		.perform(grey_tap())
	
	let sliderPopulated = GREYCondition(name: "Wait for Slider Screen to populate", block: {_ in
		var error: NSError?
		EarlGrey.select(elementWithMatcher: grey_allOf([grey_accessibilityLabel("Number: 0"), grey_accessibilityTrait(UIAccessibilityTraitStaticText)])).assert(with: grey_sufficientlyVisible(), error: &error)
		return error == nil
	}).waitWithTimeout(seconds: 10.0)
	
	GREYAssertTrue(sliderPopulated, reason: "Number:0 not found!")
	EarlGrey.select(elementWithMatcher: grey_allOf([grey_accessibilityLabel("Slider"), grey_accessibilityTrait(UIAccessibilityTraitHeader)])).assert(with: grey_sufficientlyVisible())
	
	
	
	//scrolling screen
	EarlGrey.select(elementWithMatcher: grey_allOf([grey_accessibilityID("Slider_Next"), grey_accessibilityTrait(UIAccessibilityTraitButton)]))
		.perform(grey_tap())
	
	let scrollingPopulated = GREYCondition(name: "Wait for Scrolling Screen to populate", block: {_ in
		var error: NSError?
		EarlGrey.select(elementWithMatcher: grey_allOf([grey_accessibilityID("row_1_id"), grey_accessibilityTrait(UIAccessibilityTraitStaticText)])).assert(with: grey_sufficientlyVisible(), error: &error)
		return error == nil
	}).waitWithTimeout(seconds: 10.0)
	
	GREYAssertTrue(scrollingPopulated, reason: "Row 1 not found!")
	EarlGrey.select(elementWithMatcher: grey_allOf([grey_accessibilityLabel("Scrolling"), grey_accessibilityTrait(UIAccessibilityTraitHeader)])).assert(with: grey_sufficientlyVisible())

	
	
}

class ScrollingActivityTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
			scrollingIsLaunched();
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
	
	func testScrolling() {
		EarlGrey.select(elementWithMatcher: grey_accessibilityID("LONGSCROLL")).perform(grey_swipeFastInDirection(GREYDirection.up))
	}
	
}
