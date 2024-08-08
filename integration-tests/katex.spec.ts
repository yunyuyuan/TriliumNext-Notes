import { test, expect } from '@playwright/test';

const ROOT_URL = "http://localhost:8080";
const LOGIN_PASSWORD = "eliandoran";

test("Can insert equations", async ({ page }) => {
    await page.setDefaultTimeout(60_000);
    await page.setDefaultNavigationTimeout(60_000);

    await page.goto(ROOT_URL);
    await expect(page).toHaveURL(`${ROOT_URL}/login`);

    // Log in
    await page.getByRole("textbox", { name: "Password" }).fill(LOGIN_PASSWORD);
    await page.getByRole("button", { name: "Login"}).click();
    await page.waitForURL(/\/#root\//);

    // Create a new note
    // await page.locator("button.button-widget.bx-file-blank")
    //     .click();    

    const activeNote = page.locator(".component.note-split:visible");
    const noteContent = activeNote
        .locator(".note-detail-editable-text-editor")
    await noteContent.press("Ctrl+M");
});