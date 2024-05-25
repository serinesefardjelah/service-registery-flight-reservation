import { PrismaClient } from "@prisma/client";

const endpointClient = new PrismaClient().endpoint;

//get all endpoints
export const getAllEndpoints = async (req, res) => {
  try {
    const endpoints = await endpointClient.findMany();
    res.status(200).json({ data: endpoints });
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
};

export const getEndpointByAirlineId = async (req, res) => {
  try {
    const { airlineId } = req.params;
    const endpoint = await endpointClient.findMany({
      where: {
        airlineId: Number(airlineId),
      },
    });

    if (!endpoint) {
      return res.status(404).json({ message: "Endpoint not found" });
    }

    res.status(200).json(endpoint);
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
};

//get endpoint by id
export const getEndpointById = async (req, res) => {
  const { id } = req.params;
  const endpoint = await endpointClient.findUnique({
    where: {
      id: Number(id),
    },
  });
  res.json(endpoint);
};

//create an endpoint
export const createEndpoint = async (req, res) => {
  try {
    const { airlineId, path } = req.body;
    const endpoint = await endpointClient.create({
      data: {
        airlineId,
        path,
      },
    });
    res.status(200).json({ data: endpoint });
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
};

//update an endpoint
export const updateEndpoint = async (req, res) => {
  const { id } = req.params;
  const { airlineId, path } = req.body;

  const endpoint = await endpointClient.update({
    where: {
      id: Number(id),
    },
    data: {
      airlineId,
      path,
    },
  });

  res.json(endpoint);
};

//delete endpoint
export const deleteEndpoint = async (req, res) => {
  const { id } = req.params;
  const endpoint = await endpointClient.delete({
    where: {
      id: Number(id),
    },
  });

  res.json(endpoint);
};
