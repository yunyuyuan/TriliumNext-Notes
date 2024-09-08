import i18next from "i18next";
import Backend from "i18next-fs-backend";
/*
 * Make sure not to import any modules that depend on localized messages via i18next here, as the initializations
 * are loaded later and will result in an empty string.
 */

async function initializeTranslations() {
    // Initialize translations
    await i18next.use(Backend).init({
        lng: "ro",
        fallbackLng: "en",
        ns: "server",
        backend: {
            loadPath: "translations/{{lng}}/{{ns}}.json"
        },
        debug: true
    });
}

async function startApplication() {
    await import("./www.js");
}

await initializeTranslations();
await startApplication();