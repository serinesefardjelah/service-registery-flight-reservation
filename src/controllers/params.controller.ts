import { PrismaClient } from "@prisma/client";

const paramsClient = new PrismaClient().params;

//create params
export const createParams = async (req, res) => {
  try {
    const {
      endpointId,
      departure,
      arrival,
      departure_date,
      arrival_date,
      classe,
    } = req.body;
    const params = await paramsClient.create({
      data: {
        endpointId,
        departure,
        arrival,
        departure_date,
        arrival_date,
        classe,
      },
    });
    res.status(200).json({ data: params });
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
};

//get params by endpoint id
export const getParamsByEndpointId = async (req, res) => {
  try {
    const { endpointId } = req.params;
    const params = await paramsClient.findMany({
      where: {
        endpointId: Number(endpointId),
      },
    });

    if (!params) {
      return res.status(404).json({ message: "Params not found" });
    }

    res.status(200).json(params);
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
};
