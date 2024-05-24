import { Router } from "express";

import { getAllAirlines,  getAirlineById, createAirline } from "../controllers/airline.controller";

const airlineRouter = Router();

airlineRouter.get("/", getAllAirlines);
airlineRouter.get("/:id", getAirlineById);
airlineRouter.post("/", createAirline);

export default airlineRouter;
