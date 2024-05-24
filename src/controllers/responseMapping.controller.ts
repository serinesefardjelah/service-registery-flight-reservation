import { PrismaClient } from "@prisma/client";

const responseClient = new PrismaClient().responseMapping;

//get response by endpoint id
export const getResponseByEndpointId = async (req, res) => {
  const { endpointId } = req.params;

  try {
    const response = await responseClient.findMany({
      where: {
        endpointId: Number(endpointId),
      },
    });

    if (!response) {
      return res.status(404).json({ message: "Response not found" });
    }

    res.status(200).json(response);
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
};

//post resmponse mapping
export const createResponseMapping = async (req, res) => {
  try {
    const {
      endpointId,
      departure,
      arrival,
      departure_date,
      arrival_date,
      classe,
      price,
      airlineId,
      description,
    } = req.body;
    const params = await responseClient.create({
      data: {
        endpointId,
        departure,
        arrival,
        departure_date,
        arrival_date,
        classe,
        price,
        description,
      },
    });
    res.status(200).json({ data: params });
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
};

export default responseClient;
