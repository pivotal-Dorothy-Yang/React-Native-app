 describe('Buttons Activity Test', () => {
   before(async () => {
     await device.reloadReactNative();
     await element(by.id('Text_Input_Next')).tap();
   });

   it('should display all UI elements', async() => {
     await expect(element(by.label('Buttons'))).toBeVisible();
     await expect(element(by.id('button_1_id').and(by.traits(['button'])))).toBeVisible();
     await expect(element(by.id('button_2_id').and(by.traits(['button'])))).toBeVisible();
     await expect(element(by.id('button_3_id').and(by.traits(['button'])))).toBeVisible();
     await expect(element(by.id('button_4_id').and(by.traits(['button'])))).toBeVisible();
     await expect(element(by.id('button_5_id').and(by.traits(['button'])))).toBeVisible();
     await expect(element(by.id('button_6_id').and(by.traits(['button'])))).toBeVisible();

     //both are valid for asserting image
     await expect(element(by.label('butterfly').and(by.type('RCTImageView')))).toBeVisible();
     await expect(element(by.label('butterfly').and(by.traits(['header'])))).toBeVisible();

     await expect(element(by.id('Buttons_Next'))).toBeVisible();

     //back button
     await expect(element(by.traits(['plays']).and(by.label('Text Input')))).toBeVisible();
   });
  
   it('should display alert when button 1 is tapped', async() => {
     await element(by.id('button_1_id')).tap();
     await expect(element(by.text('You pressed button 1!'))).toBeVisible();
     await element(by.label('OK').and(by.traits(['button']))).tap();
   });

   it('should display alert when button 2 is tapped', async() => {
     await element(by.id('button_2_id')).tap();
     await expect(element(by.text('You pressed button 2!'))).toBeVisible();
     await element(by.label('OK').and(by.traits(['button']))).tap();
   });

   it('should display alert when button 3 is tapped', async() => {
     await element(by.id('button_3_id')).tap();
     await expect(element(by.text('You pressed button 3!'))).toBeVisible();
     await element(by.label('OK').and(by.traits(['button']))).tap();
   });

   it('should display alert when button 4 is tapped', async() => {
     await element(by.id('button_4_id')).tap();
     await expect(element(by.text('You pressed button 4!'))).toBeVisible();
     await element(by.label('OK').and(by.traits(['button']))).tap();
   });

   it('should display alert when button 5 is tapped', async() => {
     await element(by.id('button_5_id')).tap();
     await expect(element(by.text('You pressed button 5!'))).toBeVisible();
     await element(by.label('OK').and(by.traits(['button']))).tap();
   });

   it('should display alert when button 6 is tapped', async() => {
     await element(by.id('button_6_id')).tap();
     await expect(element(by.text('You pressed button 6!'))).toBeVisible();
     await element(by.label('OK').and(by.traits(['button']))).tap();
   });

   it('should show the flat list screen and buttons screen when clicking Next and Back', async() => {
     await element(by.id('Buttons_Next')).tap();
     await expect(element(by.label('Flat List').and(by.type('RCTText')))).toBeVisible();

     await element(by.label('Buttons').and(by.traits(['plays']))).tap();

     await expect(element(by.label('Buttons').and(by.type('RCTText')))).toBeVisible();
   });

 })
