import { Router } from "express";

import {
  createResponseMapping,
  getResponseByEndpointId,
} from "../controllers/responseMapping.controller";

const responseRouter = Router();

responseRouter.get("/:endpointId", getResponseByEndpointId);
responseRouter.post("/", createResponseMapping);

export default responseRouter;
