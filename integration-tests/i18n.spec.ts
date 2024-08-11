import test, { expect } from "@playwright/test";

test("User can change language from settings", async ({ page }) => {
    // Clear all tabs
    await page.locator('.note-tab:first-of-type').locator("div").nth(1).click({ button: 'right' });
    await page.getByText('Close all tabs').click();

    // Go to options
    await page.locator('#launcher-pane div').filter({ hasText: 'Options Open New Window' }).getByRole('button').click();
    await page.locator('#launcher-pane').getByText('Options').click();

    // Check that the default value (English) is set.
    await expect(page.locator('#center-pane')).toContainText('Theme');    
    const languageCombobox = await page.getByRole('combobox').first();
    expect(languageCombobox).toHaveValue("en");

    // Select Chinese and ensure the translation is set.
    languageCombobox.selectOption("cn");
    await expect(page.locator('#center-pane')).toContainText('主题');
});