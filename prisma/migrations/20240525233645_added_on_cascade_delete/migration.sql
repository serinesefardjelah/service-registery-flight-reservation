-- DropForeignKey
ALTER TABLE "Endpoint" DROP CONSTRAINT "Endpoint_airlineId_fkey";

-- AddForeignKey
ALTER TABLE "Endpoint" ADD CONSTRAINT "Endpoint_airlineId_fkey" FOREIGN KEY ("airlineId") REFERENCES "Airline"("id") ON DELETE CASCADE ON UPDATE CASCADE;
