//
//  SliderActivityTest.swift
//  testProject
//
//  Created by Pivotal DX209 on 2017-07-18.
//  Copyright © 2017 Facebook. All rights reserved.
//

import XCTest

func sliderIsLaunched() {
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

	}


class SliderActivityTest: XCTestCase {
    
    override static func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
			sliderIsLaunched()
		}
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
	func testAllElementsAreVisible() {
		EarlGrey.select(elementWithMatcher: grey_allOf([grey_accessibilityLabel("Slider"), grey_accessibilityTrait(UIAccessibilityTraitHeader)])).assert(with: grey_sufficientlyVisible())
		EarlGrey.select(elementWithMatcher: grey_allOf([grey_accessibilityID("header-back"), grey_accessibilityLabel("Switch")])).assert(with: grey_sufficientlyVisible())
		EarlGrey.select(elementWithMatcher: grey_allOf([grey_kindOfClass(RCTSlider.self), grey_accessibilityTrait(UIAccessibilityTraitAdjustable)])).assert(with: grey_sufficientlyVisible())
		EarlGrey.select(elementWithMatcher: grey_allOf([grey_kindOfClass(RCTSlider.self), grey_accessibilityValue("50%")])).assert(with: grey_sufficientlyVisible())
		EarlGrey.select(elementWithMatcher: grey_kindOfClass(RCTSlider.self)).assert(with: grey_sliderValueMatcher(grey_closeTo(0, 0.1)))
		EarlGrey.select(elementWithMatcher: grey_allOf([grey_accessibilityLabel("Number: 0"), grey_accessibilityTrait(UIAccessibilityTraitStaticText)])).assert(with: grey_sufficientlyVisible())
	}
	
	func testChangeSliderToValueGreaterThanZeroAndLessThan100() {
		let num = 38
		EarlGrey.select(elementWithMatcher: grey_allOf([grey_kindOfClass(RCTSlider.self), grey_accessibilityTrait(UIAccessibilityTraitAdjustable)])).perform(grey_moveSliderToValue(Float(num)))
		EarlGrey.select(elementWithMatcher: grey_kindOfClass(RCTSlider.self)).assert(with: grey_sliderValueMatcher(grey_closeTo(Double(num), 1)))
		EarlGrey.select(elementWithMatcher: grey_allOf([grey_accessibilityLabel("Number: \(num)"), grey_accessibilityTrait(UIAccessibilityTraitStaticText)])).assert(with: grey_sufficientlyVisible())
	}
	
	func testChangeSliderToValue100() {
		let num = 100
		EarlGrey.select(elementWithMatcher: grey_allOf([grey_kindOfClass(RCTSlider.self), grey_accessibilityTrait(UIAccessibilityTraitAdjustable)])).perform(grey_moveSliderToValue(Float(num)))
		EarlGrey.select(elementWithMatcher: grey_kindOfClass(RCTSlider.self)).assert(with: grey_sliderValueMatcher(grey_closeTo(Double(num), 1)))
		EarlGrey.select(elementWithMatcher: grey_allOf([grey_accessibilityLabel("Number: \(num)"), grey_accessibilityTrait(UIAccessibilityTraitStaticText)])).assert(with: grey_sufficientlyVisible())

	}
	
	func testChangeSliderToValueLessThanZeroAndGreaterThanNegative100() {
		let num = -42
		EarlGrey.select(elementWithMatcher: grey_allOf([grey_kindOfClass(RCTSlider.self), grey_accessibilityTrait(UIAccessibilityTraitAdjustable)])).perform(grey_moveSliderToValue(Float(num)))
		EarlGrey.select(elementWithMatcher: grey_kindOfClass(RCTSlider.self)).assert(with: grey_sliderValueMatcher(grey_closeTo(Double(num), 1)))
		EarlGrey.select(elementWithMatcher: grey_allOf([grey_accessibilityLabel("Number: \(num)"), grey_accessibilityTrait(UIAccessibilityTraitStaticText)])).assert(with: grey_sufficientlyVisible())
	}
	
	func testChangeSliderToValueNegative100() {
		let num = -100
		EarlGrey.select(elementWithMatcher: grey_allOf([grey_kindOfClass(RCTSlider.self), grey_accessibilityTrait(UIAccessibilityTraitAdjustable)])).perform(grey_moveSliderToValue(Float(num)))
		EarlGrey.select(elementWithMatcher: grey_kindOfClass(RCTSlider.self)).assert(with: grey_sliderValueMatcher(grey_closeTo(Double(num), 1)))
		EarlGrey.select(elementWithMatcher: grey_allOf([grey_accessibilityLabel("Number: \(num)"), grey_accessibilityTrait(UIAccessibilityTraitStaticText)])).assert(with: grey_sufficientlyVisible())
	}
	
	func testOnPressNextAndBackScrollingScreenAndSliderScreenLoad() {
		EarlGrey.select(elementWithMatcher: grey_allOf([grey_accessibilityID("Slider_Next"), grey_accessibilityTrait(UIAccessibilityTraitButton)]))
			.perform(grey_tap())
		
		let scrollingPopulated = GREYCondition(name: "Wait for Scrolling Screen to populate", block: {_ in
			var error: NSError?
			EarlGrey.select(elementWithMatcher: grey_allOf([grey_accessibilityLabel("Row 1"), grey_accessibilityTrait(UIAccessibilityTraitStaticText)])).assert(grey_sufficientlyVisible(), error: &error)
			return error == nil
		}).waitWithTimeout(seconds: 10.0)
		
		GREYAssertTrue(scrollingPopulated, reason: "Row 1 not found!")
		EarlGrey.select(elementWithMatcher: grey_allOf([grey_accessibilityLabel("Scrolling"), grey_accessibilityTrait(UIAccessibilityTraitHeader)])).assert(with: grey_sufficientlyVisible())
		
		
		EarlGrey.select(elementWithMatcher: grey_allOf([grey_accessibilityID("header-back"), grey_accessibilityLabel("Slider")])).perform(grey_tap())
		
		let switchPopulated = GREYCondition(name: "Wait for Slider Screen to populate", block: {_ in
			var error: NSError?
			EarlGrey.select(elementWithMatcher: grey_allOf([grey_kindOfClass(RCTSlider.self), grey_accessibilityTrait(UIAccessibilityTraitAdjustable)])).assert(with: grey_sufficientlyVisible(), error: &error)
			return error == nil
		}).waitWithTimeout(seconds: 10.0)
		
		GREYAssertTrue(switchPopulated, reason: "Slider not found!")
		EarlGrey.select(elementWithMatcher: grey_allOf([grey_accessibilityLabel("Slider"), grey_accessibilityTrait(UIAccessibilityTraitHeader)])).assert(with: grey_sufficientlyVisible())
		
	}

}
