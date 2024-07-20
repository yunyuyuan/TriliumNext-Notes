import library_loader from "./library_loader.js";

await library_loader.requireLibrary(library_loader.I18NEXT);

i18next.init({
    lng: "ro",
    debug: true,
    resources: {
        en: {
            translation: {
                about: {
                    title: "About TriliumNext Notes",
                    homepage: "Homepage:",
                    app_version: "App version:",
                    db_version: "DB version:",
                    sync_version: "Sync version:",
                    build_date: "Build date:",
                    build_revision: "Build revision:",
                    data_directory: "Data directory:"
                }
            }
        },
        ro: {
            translation: {
                about: {
                    title: "Despre TriliumNext Notes",
                    homepage: "Site web:",
                    app_version: "Versiune aplicație:",
                    db_version: "Versiune bază de date:",
                    sync_version: "Versiune sincronizare:",
                    build_date: "Data compilării:",
                    build_revision: "Revizia compilării:",
                    data_directory: "Directorul de date:"
                }
            }
        }
    }
});

export const t = i18next.t;