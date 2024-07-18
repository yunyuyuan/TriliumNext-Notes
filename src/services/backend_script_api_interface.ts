import { Request, Response } from "express";
import AbstractBeccaEntity from "../becca/entities/abstract_becca_entity.js";
import BNote from "../becca/entities/bnote.js";

export interface ApiParams {
    startNote?: BNote;
    originEntity?: AbstractBeccaEntity<any>;
    pathParams?: string[],
    req?: Request,
    res?: Response
}