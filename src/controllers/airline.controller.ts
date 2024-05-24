import { PrismaClient } from "@prisma/client";

const airlineClient = new PrismaClient().airline;

//get all airlines
export const getAllAirlines = async (req, res) => {
  try {
    const airlines = await airlineClient.findMany({
      include: {
        Endpoint: {
          include: {
            Params: true,
            ResponseMapping: true,
          },
        },
      },
    });
    res.status(200).json({ data: airlines });
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
};

//Get airline by id
export const getAirlineById = async (req, res) => {
  const { id } = req.params;
  const airline = await airlineClient.findUnique({
    where: {
      id: Number(id),
    },
  });
  res.json(airline);
};

// //create an airline
export const createAirline = async (req, res) => {
  try {
    const { name, baseURL } = req.body;
    const airline = await airlineClient.create({
      data: {
        name,
        baseURL,
      },
    });
    res.status(200).json({ data: airline });
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
};
