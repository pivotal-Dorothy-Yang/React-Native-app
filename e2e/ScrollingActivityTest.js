// describe('Scrolling Activity Test', () => {
//       beforeEach(async () => {
//         await device.reloadReactNative();
//         await element(by.id('Text_Input_Next')).tap();
//         await element(by.id('Buttons_Next')).tap();
//         await element(by.id('Flat_List_Next')).tap();
//         await element(by.id('Section_List_Next')).tap();
//         await element(by.id('Picker_Next')).tap();
//         await element(by.id('Switch_Next')).tap();
//         await element(by.id('Slider_Next')).tap();
//       });

//       it('should dislay header and back button', async() => {
//         await expect(element(by.label('Scrolling').and(by.type('RCTText')))).toBeVisible();
//         await expect(element(by.traits(['plays']).and(by.label('Slider')))).toBeVisible();
//       });

//       it('should display all row elements', async() => {
//       	await waitFor(element(by.id('row_1_id'))).toBeVisible().whileElement(by.id('LONGSCROLL')).scroll(150, 'down');
//       	await expect(element(by.id('row_1_id'))).toHaveLabel('Row 1');

//       	await waitFor(element(by.id('row_2_id'))).toBeVisible().whileElement(by.id('LONGSCROLL')).scroll(150, 'down');
//       	await expect(element(by.id('row_2_id'))).toHaveLabel('Row 2');

//       	await waitFor(element(by.id('row_3_id'))).toBeVisible().whileElement(by.id('LONGSCROLL')).scroll(150, 'down');
//       	await expect(element(by.id('row_3_id'))).toHaveLabel('Row 3');

//       	await waitFor(element(by.id('row_4_id'))).toBeVisible().whileElement(by.id('LONGSCROLL')).scroll(150, 'down');
//       	await expect(element(by.id('row_4_id'))).toHaveLabel('Row 4');

//       	await waitFor(element(by.id('row_5_id'))).toBeVisible().whileElement(by.id('LONGSCROLL')).scroll(150, 'down');
//       	await expect(element(by.id('row_5_id'))).toHaveLabel('Row 5');

//       	await waitFor(element(by.id('row_6_id'))).toBeVisible().whileElement(by.id('LONGSCROLL')).scroll(150, 'down');
//       	await expect(element(by.id('row_6_id'))).toHaveLabel('Row 6');

//       	await waitFor(element(by.id('row_7_id'))).toBeVisible().whileElement(by.id('LONGSCROLL')).scroll(150, 'down');
//       	await expect(element(by.id('row_7_id'))).toHaveLabel('Row 7');

//       	await waitFor(element(by.id('row_8_id'))).toBeVisible().whileElement(by.id('LONGSCROLL')).scroll(150, 'down');
//       	await expect(element(by.id('row_8_id'))).toHaveLabel('Row 8');

//       	await waitFor(element(by.id('row_9_id'))).toBeVisible().whileElement(by.id('LONGSCROLL')).scroll(150, 'down');
//       	await expect(element(by.id('row_9_id'))).toHaveLabel('Row 9');

//       	await waitFor(element(by.id('row_10_id'))).toBeVisible().whileElement(by.id('LONGSCROLL')).scroll(150, 'down');
//       	await expect(element(by.id('row_10_id'))).toHaveLabel('Row 10');

//       	await waitFor(element(by.id('row_11_id'))).toBeVisible().whileElement(by.id('LONGSCROLL')).scroll(150, 'down');
//       	await expect(element(by.id('row_11_id'))).toHaveLabel('Row 11');

//       	await waitFor(element(by.id('row_12_id'))).toBeVisible().whileElement(by.id('LONGSCROLL')).scroll(150, 'down');
//       	await expect(element(by.id('row_12_id'))).toHaveLabel('Row 12');

//       	await waitFor(element(by.id('row_13_id'))).toBeVisible().whileElement(by.id('LONGSCROLL')).scroll(150, 'down');
//       	await expect(element(by.id('row_13_id'))).toHaveLabel('Row 13');

//       	await waitFor(element(by.id('row_14_id'))).toBeVisible().whileElement(by.id('LONGSCROLL')).scroll(150, 'down');
//       	await expect(element(by.id('row_14_id'))).toHaveLabel('Row 14');

//       	await waitFor(element(by.id('row_15_id'))).toBeVisible().whileElement(by.id('LONGSCROLL')).scroll(150, 'down');
//       	await expect(element(by.id('row_15_id'))).toHaveLabel('Row 15');

//       });

// 	  it('should display all image elements', async() => {
//       	await waitFor(element(by.id('img_1'))).toBeVisible().whileElement(by.id('LONGSCROLL')).scroll(500, 'down');
//       	await expect(element(by.id('img_1'))).toBeVisible();

//       	await waitFor(element(by.id('img_2'))).toBeVisible().whileElement(by.id('LONGSCROLL')).scroll(500, 'down');
//       	await expect(element(by.id('img_2'))).toBeVisible();

//       	await waitFor(element(by.id('img_3'))).toBeVisible().whileElement(by.id('LONGSCROLL')).scroll(500, 'down');
//       	await expect(element(by.id('img_3'))).toBeVisible();

//       	await waitFor(element(by.id('img_4'))).toBeVisible().whileElement(by.id('LONGSCROLL')).scroll(500, 'down');
//       	await expect(element(by.id('img_4'))).toBeVisible();

//       	await waitFor(element(by.id('img_5'))).toBeVisible().whileElement(by.id('LONGSCROLL')).scroll(500, 'down');
//       	await expect(element(by.id('img_5'))).toBeVisible();
//       });
// })