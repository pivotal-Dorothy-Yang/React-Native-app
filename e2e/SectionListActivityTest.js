// describe('Section List Activity Test', () => {
//       before(async () => {
//         await device.reloadReactNative();
//         await element(by.id('Text_Input_Next')).tap();
//         await element(by.id('Buttons_Next')).tap();
//         await element(by.id('Flat_List_Next')).tap();
//       });

//       it('should display header, back button and next button', async() => {
//         await expect(element(by.label('Section List'))).toBeVisible();
//         await expect(element(by.id('Section_List_Next'))).toBeVisible();
//         await expect(element(by.traits(['plays']).and(by.label('Flat List')))).toBeVisible()
//       });

//       it('should display Section D items', async() => {
//         await expect(element(by.id('section D'))).toBeVisible();
//         await expect(element(by.id('section Data 1'))).toBeVisible();
//         await expect(element(by.id('section Data 2'))).toBeVisible();
//         await expect(element(by.id('section Data 3'))).toBeVisible();
//         await expect(element(by.id('section Data 4'))).toBeVisible();
//       });

//       it('should display Section I items', async() => {
//         await expect(element(by.id('section I'))).toBeVisible();
//         await expect(element(by.id('section Item 1'))).toBeVisible();
//         await expect(element(by.id('section Item 2'))).toBeVisible();
//         await expect(element(by.id('section Item 3'))).toBeVisible();
//         await expect(element(by.id('section Item 4'))).toBeVisible();
//         await expect(element(by.id('section Item 5'))).toBeVisible();
//       });

//       it('should display Section T items', async() => {
//         await expect(element(by.id('section T'))).toBeVisible();
//         await expect(element(by.id('section Task 1'))).toBeVisible();
//         await expect(element(by.id('section Task 2'))).toBeVisible();
//         await expect(element(by.id('section Task 3'))).toBeVisible();
//       });

//       it('should display picker and section list when next and back buttons are pressed', async() => {
//         await element(by.id('Section_List_Next')).tap();
//         await expect(element(by.label('Picker').and(by.type('RCTText')))).toBeVisible();
//         await element(by.traits(['plays']).and(by.label('Section List'))).tap();
//       });
//     })