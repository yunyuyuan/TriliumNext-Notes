import config from "./config.js";

export = process.env.TRILIUM_HOST || config['Network']['host'] || '0.0.0.0';
