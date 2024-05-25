import { Router } from "express";

import {
  getAllAirlines,
  getAirlineById,
  createAirline,
  updateAirline,
  deleteAirline,
} from "../controllers/airline.controller";

const airlineRouter = Router();

airlineRouter.get("/", getAllAirlines);
airlineRouter.get("/:id", getAirlineById);
airlineRouter.post("/", createAirline);
airlineRouter.put("/:id", updateAirline);
airlineRouter.delete("/:id", deleteAirline);

export default airlineRouter;
