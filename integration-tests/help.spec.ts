import test, { expect } from "@playwright/test";

test('Complete help in search', async ({ page }) => {
    await page.goto('http://localhost:8082');    

    // Clear all tabs
    await page.locator('.note-tab:first-of-type').locator("div").nth(1).click({ button: 'right' });
    await page.getByText('Close all tabs').click();

    await page.locator('#launcher-container').getByRole('button', { name: '' }).first().click();
    await page.getByRole('cell', { name: ' ' }).locator('span').first().click();
    await page.getByRole('button', { name: 'complete help on search syntax' }).click();    
    expect((await page.waitForEvent('popup')).url()).toBe("https://triliumnext.github.io/Docs/Wiki/search.html");
});