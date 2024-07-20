import library_loader from "./library_loader.js";

await library_loader.requireLibrary(library_loader.I18NEXT);

i18next.init({
    lng: "ro",
    debug: true
});

export const t = i18next.t;