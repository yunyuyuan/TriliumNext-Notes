import i18next from "i18next";
import Backend from "i18next-fs-backend";

export async function initializeTranslations() {
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