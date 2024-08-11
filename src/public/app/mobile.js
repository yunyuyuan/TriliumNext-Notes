import appContext from "./components/app_context.js";
import glob from "./services/glob.js";

glob.setupGlobs()

appContext.earlyInit();
const MobileLayout = (await import("./layouts/mobile_layout.js")).default;
appContext.setLayout(new MobileLayout());
appContext.start();
