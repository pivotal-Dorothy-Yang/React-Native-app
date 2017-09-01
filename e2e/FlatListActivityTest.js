// describe('Flat List Activity Test', () => {
//   before(async () => {
//     await device.reloadReactNative();
//     await element(by.id('Text_Input_Next')).tap();
//     await element(by.id('Buttons_Next')).tap();
//   });

//   it('should display the header, back button and next button', async() => {
//     await expect(element(by.label('Flat List'))).toBeVisible();
//     await expect(element(by.id('Flat_List_Next'))).toBeVisible();
//     await expect(element(by.traits(['plays']).and(by.label('Buttons')))).toBeVisible();
//   });

//   it('should display the items list', async() => {
//     await expect(element(by.id('flat Item 1'))).toBeVisible();
//     await expect(element(by.id('flat Item 2'))).toBeVisible();
//     await expect(element(by.id('flat Item 3'))).toBeVisible();
//     await expect(element(by.id('flat Item 4'))).toBeVisible();
//     await expect(element(by.id('flat Item 5'))).toBeVisible();
//     await expect(element(by.id('flat Item 6'))).toBeVisible();
//     await expect(element(by.id('flat Item 7'))).toBeVisible();
//     await expect(element(by.id('flat Item 8'))).toBeVisible();
//     await expect(element(by.id('flat Item 9'))).toBeVisible();
//     await expect(element(by.id('flat Item 10'))).toBeVisible();
//     await expect(element(by.id('flat Item 12'))).toBeVisible();
//   });

//   it('should display Section List and Flat List when Next and Back buttons are pressed', async() => {
//     await element(by.id('Flat_List_Next')).tap();
//     await expect(element(by.label('Section List'))).toBeVisible();
//     await element(by.traits(['plays']).and(by.label('Flat List'))).tap();
//     await expect(element(by.label('Flat List').and(by.type('RCTText')))).toBeVisible();
//   });
// })