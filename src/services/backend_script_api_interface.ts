import { Request, Response } from "express";
import AbstractBeccaEntity = require("../becca/entities/abstract_becca_entity");
import BNote = require("../becca/entities/bnote");

export interface ApiParams {
    startNote?: BNote | null;
    originEntity?: AbstractBeccaEntity<any> | null;
    pathParams?: string[],
    req?: Request,
    res?: Response
}