// describe('Switch Activity Test', () => {
//       before(async () => {
//         await device.reloadReactNative();
//         await element(by.id('Text_Input_Next')).tap();
//         await element(by.id('Buttons_Next')).tap();
//         await element(by.id('Flat_List_Next')).tap();
//         await element(by.id('Section_List_Next')).tap();
//         await element(by.id('Picker_Next')).tap();
//       });

//       it('should dislay all UI elements', async() => {
//         await expect(element(by.label('Switch'))).toBeVisible();
//         await expect(element(by.id('defaultOFF_id'))).toBeVisible();
//         await expect(element(by.id('defaultON_id'))).toBeVisible();
//         await expect(element(by.id('left_switch_id'))).toHaveLabel('OFF');
//         await expect(element(by.id('right_switch_id'))).toHaveLabel('ON');
//         await expect(element(by.id('Switch_Next'))).toBeVisible();
//         await expect(element(by.traits(['plays']).and(by.label('Picker')))).toBeVisible();
//       });

//       it('should turn left switch ON and OFF', async() => {
//         await element(by.id('defaultOFF_id')).tap();
//         await expect(element(by.id('left_switch_id'))).toHaveLabel('ON');
//         await element(by.id('defaultOFF_id')).tap();
//         await expect(element(by.id('left_switch_id'))).toHaveLabel('OFF');
//       });

//       it('should turn right switch OFF and ON', async() => {
//         await element(by.id('defaultON_id')).tap();
//         await expect(element(by.id('right_switch_id'))).toHaveLabel('OFF');
//         await element(by.id('defaultON_id')).tap();
//         await expect(element(by.id('right_switch_id'))).toHaveLabel('ON');
//       });

//       it('should display Slider screen and Switch screen when Next and Back are tapped', async() =>{
//         await element(by.id('Switch_Next')).tap();
//         await expect(element(by.label('Slider'))).toBeVisible();
//         await element(by.traits(['plays']).and(by.label('Switch'))).tap();
//         await expect(element(by.label('Switch'))).toBeVisible();
//       });
// })