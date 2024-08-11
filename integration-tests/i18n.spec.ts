import test, { expect } from "@playwright/test";

test("User can change language from settings", async ({ page }) => {
    await page.goto('http://localhost:8082');

    // Clear all tabs
    await page.locator('.note-tab:first-of-type').locator("div").nth(1).click({ button: 'right' });
    await page.getByText('Close all tabs').click();

    // Go to options -> Appearance
    await page.locator('#launcher-pane div').filter({ hasText: 'Options Open New Window' }).getByRole('button').click();
    await page.locator('#launcher-pane').getByText('Options').click();
    await page.locator('#center-pane').getByText('Appearance').click();

    // Check that the default value (English) is set.
    await expect(page.locator('#center-pane')).toContainText('Theme');    
    const languageCombobox = await page.getByRole('combobox').first();
    expect(languageCombobox).toHaveValue("en");

    // Select Chinese and ensure the translation is set.
    languageCombobox.selectOption("cn");
    await expect(page.locator('#center-pane')).toContainText('主题');

    // Select English again.
    languageCombobox.selectOption("en");
});