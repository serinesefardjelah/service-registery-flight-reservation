import { Router } from "express";

import {
  getParamsByEndpointId,
  createParams,
} from "../controllers/params.controller";

const paramsRouter = Router();

paramsRouter.get("/:endpointId", getParamsByEndpointId);
paramsRouter.post("/", createParams);

export default paramsRouter;
