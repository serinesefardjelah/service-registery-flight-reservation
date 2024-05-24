import express from "express";
import airlineRouter from "../src/routes/airline.router";
import endpointRouter from "../src/routes/endpoint.router";
import paramsRouter from "../src/routes/params.router";
import responseRouter from "../src/routes/responseMapping.router";
const app = express();
const port = process.env.PORT || 8000;

app.use(express.json());
app.use("/airlines", airlineRouter);
app.use("/endpoints", endpointRouter);
app.use("/params", paramsRouter);
app.use("/response", responseRouter);

app.get("/ping", (req, res) => {
  res.send({ message: "Hello World" }).status(200);
});

app.listen(port, () => {
  console.log(`Server is running on port ${port}`);
});
