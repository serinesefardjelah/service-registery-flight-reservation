import { Router } from "express";

import {
  getAllEndpoints,
  getEndpointByAirlineId,
  getEndpointById,
  createEndpoint,
} from "../controllers/endpoint.controller";
const endpointRouter = Router();

endpointRouter.get("/", getAllEndpoints);
endpointRouter.get("/:id", getEndpointById);
endpointRouter.get("/airline/:airlineId", getEndpointByAirlineId);
endpointRouter.post("/", createEndpoint);

export default endpointRouter;
