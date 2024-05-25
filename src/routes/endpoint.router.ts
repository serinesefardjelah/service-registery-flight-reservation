import { Router } from "express";

import {
  getAllEndpoints,
  getEndpointByAirlineId,
  getEndpointById,
  createEndpoint,
  updateEndpoint,
} from "../controllers/endpoint.controller";
const endpointRouter = Router();

endpointRouter.get("/", getAllEndpoints);
endpointRouter.get("/:id", getEndpointById);
endpointRouter.get("/airline/:airlineId", getEndpointByAirlineId);
endpointRouter.post("/", createEndpoint);
endpointRouter.put("/:id", updateEndpoint);

export default endpointRouter;
