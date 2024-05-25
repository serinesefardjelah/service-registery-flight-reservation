import { PrismaClient } from "@prisma/client";

const airlineClient = new PrismaClient().airline;

//get all airlines
export const getAllAirlines = async (req, res) => {
  try {
    const airlines = await airlineClient.findMany({
      include: {
        Endpoint: {
          include: {
            Params: {
              select: {
                departure: true,
                arrival: true,
                departure_date: true,
                arrival_date: true,
                classe: true,
              },
            },
            ResponseMapping: {
              select: {
                id: true,
                departure: true,
                arrival: true,
                departure_date: true,
                arrival_date: true,
                classe: true,
                price: true,
                description: true,
              },
            },
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

//update airline
export const updateAirline = async (req, res) => {
  const { id } = req.params;
  const { name, baseURL } = req.body;

  const airline = await airlineClient.update({
    where: {
      id: Number(id),
    },
    data: {
      name,
      baseURL,
    },
  });

  res.json(airline);
};
