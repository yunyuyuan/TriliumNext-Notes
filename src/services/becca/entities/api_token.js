"use strict";

const dateUtils = require('../../date_utils.js');
const AbstractEntity = require("./abstract_entity.js");

/**
 * ApiToken is an entity representing token used to authenticate against Trilium API from client applications. Currently used only by Trilium Sender.
 */
class ApiToken extends AbstractEntity {
    static get entityName() { return "api_tokens"; }
    static get primaryKeyName() { return "apiTokenId"; }
    static get hashedProperties() { return ["apiTokenId", "token", "utcDateCreated"]; }

    constructor(row) {
        super();

        this.apiTokenId = row.apiTokenId;
        this.token = row.token;
        this.utcDateCreated = row.utcDateCreated || dateUtils.utcNowDateTime();
    }
}

module.exports = ApiToken;
