//
//  PickerActivityTest.swift
//  testProject
//
//  Created by Pivotal DX209 on 2017-07-17.
//  Copyright © 2017 Facebook. All rights reserved.
//

import XCTest

func pickerIsLaunched() {
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
	
	
	
	EarlGrey.select(elementWithMatcher: grey_allOf([grey_accessibilityID("Section_List_Next"), grey_accessibilityTrait(UIAccessibilityTraitButton)]))
		.perform(grey_tap())
	
	let pickerPopulated = GREYCondition(name: "Wait for Picker Screen to populate", block: {_ in
		var error: NSError?
		EarlGrey.select(elementWithMatcher: grey_allOf([grey_accessibilityLabel("Days of the Week"), grey_accessibilityTrait(UIAccessibilityTraitStaticText)])).assert(grey_sufficientlyVisible(), error: &error)
		return error == nil
	}).waitWithTimeout(seconds: 10.0)
	
	GREYAssertTrue(pickerPopulated, reason: "Days of the Week not found!")
	EarlGrey.select(elementWithMatcher: grey_allOf([grey_accessibilityLabel("Picker"), grey_accessibilityTrait(UIAccessibilityTraitHeader)])).assert(with: grey_sufficientlyVisible())

	
}



class PickerActivityTest: XCTestCase {
    
    override static func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
			pickerIsLaunched()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
	func testInitialElementsAreVisible() {
		EarlGrey.select(elementWithMatcher: grey_allOf([grey_accessibilityLabel("Picker"), grey_accessibilityTrait(UIAccessibilityTraitHeader)])).assert(with: grey_sufficientlyVisible())
		EarlGrey.select(elementWithMatcher: grey_allOf([grey_accessibilityID("header-back"), grey_accessibilityLabel("Section List")])).assert(with: grey_sufficientlyVisible())
		EarlGrey.select(elementWithMatcher: grey_accessibilityLabel("You picked: Monday")).assert(with: grey_sufficientlyVisible())
		EarlGrey.select(elementWithMatcher: grey_pickerColumnSetToValue(0, "Monday")).assert(with: grey_sufficientlyVisible())
	}
	
	
	func testsample() {
		
		//EarlGrey.select(elementWithMatcher: grey_kindOfClass(UIPickerView.self)).perform(grey_setPickerColumnToValue(0, "Monday"))
		
		
		//EarlGrey.select(elementWithMatcher: grey_allOf([grey_kindOfClass(UIPickerView.self), grey_accessibilityID("Tuesday")])).perform(grey_setPickerColumnToValue(0, "Monday"))
		
//		EarlGrey.select(elementWithMatcher: grey_pickerColumnSetToValue(0, "Monday")).perform(grey_setPickerColumnToValue(0, "Tuesday"))

		EarlGrey.select(elementWithMatcher: grey_allOf([grey_kindOfClass(UIPickerView.self),grey_pickerColumnSetToValue(0, "Monday")])).assert(with: grey_sufficientlyVisible())

		EarlGrey.select(elementWithMatcher: grey_kindOfClass(UIPickerView.self)).perform(grey_setPickerColumnToValue(0, "Monday"))
		
		
//		EarlGrey.select(elementWithMatcher: grey_kindOfClass(RCTPicker.self)).perform(grey_setPickerColumnToValue(0, "Tuesday"))
		
//		EarlGrey.select(elementWithMatcher: grey_accessibilityLabel("Tuesday")).perform(grey_setPickerColumnToValue(0, "Monday"))
		
//		EarlGrey.select(elementWithMatcher:grey_pickerColumnSetToValue(0, "Monday"))
//			.using(searchAction: grey_scrollInDirection(GREYDirection.down, 20),
//			       onElementWithMatcher: grey_kindOfClass(UIView.self))
//			.assert(grey_notNil())
		
//		EarlGrey.select(elementWithMatcher: grey_pickerColumnSetToValue(0, "Tuesday")).perform(grey_setPickerColumnToValue(0, "Wednesday"))
		
		
//	 EarlGrey.select(elementWithMatcher: grey_kindOfClass(UITableView.self))
//		.perform(grey_scrollToContentEdge(GREYContentEdge.top))
	}
	
	func testOnPressNextAndBackSwitchScreenAndPickerScreenLoad() {
		EarlGrey.select(elementWithMatcher: grey_allOf([grey_accessibilityID("Picker_Next"), grey_accessibilityTrait(UIAccessibilityTraitButton)]))
			.perform(grey_tap())
		
		let switchPopulated = GREYCondition(name: "Wait for Switch Screen to populate", block: {_ in
			var error: NSError?
			EarlGrey.select(elementWithMatcher: grey_allOf([grey_accessibilityLabel("ON"), grey_accessibilityTrait(UIAccessibilityTraitStaticText)])).assert(grey_sufficientlyVisible(), error: &error)
			return error == nil
		}).waitWithTimeout(seconds: 10.0)
		
		GREYAssertTrue(switchPopulated, reason: "Switches were not found!")
		EarlGrey.select(elementWithMatcher: grey_allOf([grey_accessibilityLabel("Switch"), grey_accessibilityTrait(UIAccessibilityTraitHeader)])).assert(with: grey_sufficientlyVisible())
		
		
		EarlGrey.select(elementWithMatcher: grey_allOf([grey_accessibilityID("header-back"), grey_accessibilityLabel("Picker")])).perform(grey_tap())
		
		let pickerPopulated = GREYCondition(name: "Wait for Picker Screen to populate", block: {_ in
			var error: NSError?
			EarlGrey.select(elementWithMatcher: grey_allOf([grey_accessibilityLabel("Days of the Week"), grey_accessibilityTrait(UIAccessibilityTraitStaticText)])).assert(grey_sufficientlyVisible(), error: &error)
			return error == nil
		}).waitWithTimeout(seconds: 10.0)
		
		GREYAssertTrue(pickerPopulated, reason: "Days of the Week not found!")
		EarlGrey.select(elementWithMatcher: grey_allOf([grey_accessibilityLabel("Picker"), grey_accessibilityTrait(UIAccessibilityTraitHeader)])).assert(with: grey_sufficientlyVisible())
		
	}

	
}
