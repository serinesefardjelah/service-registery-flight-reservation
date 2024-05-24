import { PrismaClient } from "@prisma/client";
const prisma = new PrismaClient();

async function main() {
  //   const airline = await prisma.airline.create({
  //     data: {
  //       name: "Air Algerie",
  //     },
  //   });
  // const airline = await prisma.airline.findMany();
  //   console.log(airline);
  await prisma.responseMapping.deleteMany();
  await prisma.params.deleteMany();
  await prisma.endpoint.deleteMany();
  await prisma.airline.deleteMany();
}

main()
  .catch((e) => {
    console.log(e.message);
  })
  .finally(async () => {
    await prisma.$disconnect();
  });
