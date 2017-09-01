// describe('Slider Activity Test', () => {
//       beforeEach(async () => {
//         await device.reloadReactNative();
//         await element(by.id('Text_Input_Next')).tap();
//         await element(by.id('Buttons_Next')).tap();
//         await element(by.id('Flat_List_Next')).tap();
//         await element(by.id('Section_List_Next')).tap();
//         await element(by.id('Picker_Next')).tap();
//         await element(by.id('Switch_Next')).tap();
//       });

//       it('should dislay all UI elements', async() => {
//         await expect(element(by.label('Slider'))).toBeVisible();
//         //can't verify the current value of the slider
//         //startsMedia trait corresponds to adjustable trait in the hierarchy
//         await expect(element(by.type('RCTSlider').and(by.traits(['startsMedia'])))).toBeVisible();
//         await expect(element(by.id('Slider_Next'))).toBeVisible();
//         await expect(element(by.text('Number: 0'))).toBeVisible();
//         //assert back button
//         await expect(element(by.traits(['plays']).and(by.label('Switch')))).toBeVisible(); 
//       });

//       it('should change the slider value to -100', async() => {
//         await element(by.traits(['startsMedia']).and(by.type('RCTSlider'))).swipe('left', 'slow');
//         await expect(element(by.text('Number: -100'))).toBeVisible();

//         //the methods below to change the value of the slider don't work
//         // await waitFor(element(by.text('Number: -75'))).toBeVisible().whileElement(by.traits(['startsMedia']).and(by.type('RCTSlider'))).swipe('left', 'slow');
//         // await waitFor(element(by.text('Number: -75'))).toBeVisible().whileElement(by.type('RCTSlider')).scroll(50, 'left');
//       });

//       //can't control what value you slide to. Using swipe causes you to swipe to the ends of the seekbar
//       //can only perform swipe if the initial value is 0, perhaps because the swipe starts in the middle of the screen by design
//       it('should change the slider value to +100', async() => {
//         await element(by.traits(['startsMedia']).and(by.type('RCTSlider'))).swipe('right', 'slow');
//         await expect(element(by.text('Number: 100'))).toBeVisible();
//       });

//       it('should click on Next and Back and verify Scrolling and Slider screens are visible', async() => {
//         await element(by.id('Slider_Next')).tap();
//         await expect(element(by.label('Scrolling'))).toBeVisible();
//         await element(by.traits(['plays']).and(by.label('Slider'))).tap();
//         await expect(element(by.label('Slider'))).toBeVisible();
//       });
// })
