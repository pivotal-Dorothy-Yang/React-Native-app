// describe('Picker Activity Test', () => {
//       before(async () => {
//         await device.reloadReactNative();
//         await element(by.id('Text_Input_Next')).tap();
//         await element(by.id('Buttons_Next')).tap();
//         await element(by.id('Flat_List_Next')).tap();
//         await element(by.id('Section_List_Next')).tap();
//       });

//       it('should display all UI elements', async() => {
//         await expect(element(by.label('Picker'))).toBeVisible();
//         await expect(element(by.id('Picker_Next'))).toBeVisible();

//         //back button
//         await expect(element(by.traits(['plays']).and(by.label('Section List')))).toBeVisible();

//         await expect(element(by.text('Days of the Week'))).toBeVisible();
//         await expect(element(by.text('You picked: Monday'))).toBeVisible();
//         // await expect(element(by.type('RCTPicker'))).toHaveValue('Monday');
//         // await expect(element(by.value('Monday, 1 of 7'))).toBeVisible();
//         // await expect(element(by.label('Monday').withAncestor(by.type('RCTPicker')))).toBeVisible();
//       });

//       //can't change to a lower value and change back to a higher value
//       // it('should set the picker value to Monday and verify it is updated', async() => {
//       //   await element(by.label('Tuesday').withAncestor(by.type('RCTPicker'))).atIndex(0).tap();
//       //   await element(by.label('Monday').withAncestor(by.type('RCTPicker'))).atIndex(0).tap();
//       // });

//       it('should set the picker value to Tuesday and verify it is updated', async() => {
//         //technically works
//         await element(by.label('Tuesday').withAncestor(by.type('RCTPicker'))).atIndex(0).tap();
//         await expect(element(by.text('You picked: Tuesday'))).toBeVisible();
//         //await element(by.label('Friday').withAncestor(by.type('RCTPicker'))).atIndex(0).tap();
//         // await element(by.label('Thursday')).tap();

//         // await element(by.type('RCTPicker').and(by.label('Monday'))).atIndex(0).scrollTo('bottom');

//         //doesn't work
//         // await element(by.type('RCTPicker').and(by.label('Empty List'))).atIndex(0).swipe('up', 'slow');
//       });
      
//       // it('should set the picker value to Monday and verify it is updated', async() => {
//       //   await element(by.label('Monday').withAncestor(by.type('RCTPicker'))).atIndex(0).tap();
//       //   await expect(element(by.text('You picked: Monday'))).toBeVisible();
//       // });

      

//       it('should set the picker value to Wednesday and verify it is updated', async() => {
//         await element(by.label('Wednesday').withAncestor(by.type('RCTPicker'))).atIndex(0).tap();
//         await expect(element(by.text('You picked: Wednesday'))).toBeVisible();
//       });

//       it('should set the picker value to Thursday and verify it is updated', async() => {
//         await element(by.label('Thursday').withAncestor(by.type('RCTPicker'))).atIndex(0).tap();
//         await expect(element(by.text('You picked: Thursday'))).toBeVisible();
//       });

//       it('should set the picker value to Friday and verify it is updated', async() => {
//         await element(by.label('Friday').withAncestor(by.type('RCTPicker'))).atIndex(0).tap();
//         await expect(element(by.text('You picked: Friday'))).toBeVisible();
//       });

//       it('should set the picker value to Saturday and verify it is updated', async() => {
//         await element(by.label('Saturday').withAncestor(by.type('RCTPicker'))).atIndex(0).tap();
//         await expect(element(by.text('You picked: Saturday'))).toBeVisible();
//       });

//       it('should set the picker value to Sunday and verify it is updated', async() => {
//         await element(by.label('Sunday').withAncestor(by.type('RCTPicker'))).atIndex(0).tap();
//         await expect(element(by.text('You picked: Sunday'))).toBeVisible();
//       });

//       it('should display Switch screen and Picker screen when Next and Back button when pressed', async() => {
//         await element(by.id('Picker_Next')).tap();
//         await expect(element(by.type('RCTText').and(by.label('Switch')))).toBeVisible();
//         await element(by.traits(['plays']).and(by.label('Picker'))).tap();
//         await expect(element(by.type('RCTText').and(by.label('Picker')))).toBeVisible();
//       });

//     })