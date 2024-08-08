import { test, expect } from '@playwright/test';

test("Displays update badge when there is a version available", async ({ page }) => {
    await page.goto("http://localhost:8080");
});