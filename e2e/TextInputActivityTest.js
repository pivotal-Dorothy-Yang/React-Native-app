describe('Text Input Activity Test', () => {
  before(async () => {
    await device.reloadReactNative();
  });

  it('should have all UI elements visible', async() => {
    // header trait is not accessible in wix detox due to improper matching
    // await expect(element(by.traits(['header']))).toBeVisible();
    // await expect(element(by.traits(['header']))).toExist();
    // await expect(element(by.label('Text Input').and(by.traits(['header'])))).toBeVisible();
    // await expect(element(by.traits(['header']))).toExist();


    /* this works even though the hierarchy viewer does not contain text= 'Text Input'
    this works even though there are multiple AX.label='Text Input'. It doesn't throw a multiple view matchers, because only 1 is AX = Y
    */
    await expect(element(by.text('Text Input'))).toBeVisible();
    
    await expect(element(by.id('input_1_id'))).toHaveValue('Type your text here!');
    await expect(element(by.id('input_2_id'))).toHaveValue('col 1');
    await expect(element(by.id('input_3_id'))).toHaveValue('col 2');

    //valid ways of checking that the next button is present
    await expect(element(by.traits(['button']).and(by.id('Text_Input_Next')))).toBeVisible();
    await expect(element(by.traits(['plays']).and(by.label('Next')))).toBeVisible();

    //await expect(element(by.traits(['plays']))).toHaveId('Text_Input_Next');  //doesn't work because they aren't located together in the view hierarchy
    
    // await expect(element(by.traits(['plays']))).toHaveLabel('Next'); 
    /*matches multiple views, but it only matches one element in the hierarchy it shows, 
    seems to check traits first and not check labels at all
    you could replace the label with any other text and you will still have multiple matchers
    */
  });

  it('should click the clear text button and verify the text is not visible', async() => {
    let text = 'This text will be cleared';
    await element(by.id('input_1_id')).tap();
    await element(by.id('input_1_id')).typeText(text);
    await element(by.type('UIButton')).tap();
    await expect(element(by.text(text))).toBeNotVisible();
  });

  it('should type into first textbox and verify is visible', async() => {
    let text1 = 'This is a sample sentence.';
    await element(by.id('input_1_id')).tap();
    await element(by.id('input_1_id')).typeText(text1);
    //.toHaveValue() is also valid
    await expect(element(by.id('input_1_id'))).toHaveText(text1);
  });

  it('should type into second textbox and verify is visible', async() => {
    let text2 = 'hello';
    await element(by.id('input_2_id')).tap();
    await element(by.id('input_2_id')).typeText(text2);
    //.toHaveValue() is also valid
    await expect(element(by.id('input_2_id'))).toHaveText(text2);
  });

  it('should type into third textbox and verify is visible', async() => {
    let text3 = 'blah blah blah';
    await element(by.id('input_3_id')).tap();
    await element(by.id('input_3_id')).typeText(text3);
    //.toHaveValue() is also valid
    await expect(element(by.id('input_3_id'))).toHaveText(text3);
  });
  
  it('should click on Next and Back and verify the correct screens are visible', async() => {
    await element(by.id('Text_Input_Next')).tap();

    await expect(element(by.type('RCTText').and(by.label('Buttons')))).toBeVisible();
    //await expect(element(by.type('RCTText'))).toHaveLabel('Buttons');
    //fails, but when you combine the two in an "and" statement like the one above then it works

    //valid ways to access back button
    await expect(element(by.traits(['plays']).and(by.label('Text Input')))).toBeVisible();
    await expect(element(by.traits(['button']).and(by.id('header-back')))).toBeVisible();
    
    await element(by.traits(['plays']).and(by.label('Text Input'))).tap();

    await expect(element(by.type('RCTText').and(by.label('Text Input')))).toBeVisible();

    /*thing below fails, though are all valid combinations according to the hierarchy; also makes no difference if
    if you change the order of the matchers
    */
    //await expect(element(by.traits(['button']).and(by.label('Text Input')))).toBeVisible();
    //await expect(element(by.label('Text Input').and(by.id('header-back')))).toBeVisible();
    //await expect(element(by.id('header-back').and(by.label('Text Input')))).toBeVisible();
    //await expect(element(by.traits(['button']).and(by.label('Text Input')))).toBeVisible();
    //await expect(element(by.label('Text Input').and(by.traits(['button'])))).toBeVisible();

    //await element(by.label('Text Input"')).tap();     matches multiple elements

  });
})