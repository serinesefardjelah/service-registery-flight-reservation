import { Router } from "express";

import {
  getAllAirlines,
  getAirlineById,
  createAirline,
  updateAirline,
} from "../controllers/airline.controller";

const airlineRouter = Router();

airlineRouter.get("/", getAllAirlines);
airlineRouter.get("/:id", getAirlineById);
airlineRouter.post("/", createAirline);
airlineRouter.put("/:id", updateAirline);

export default airlineRouter;
